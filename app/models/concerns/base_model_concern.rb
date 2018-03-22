module BaseModelConcern
  extend ActiveSupport::Concern
  
  module ClassMethods
    def search_by_params(options = {})
      result = self.all
      if options.present?
        keys = options.keys
        keys.delete(:page)
        keys.delete(:per)
        keys.each do |key|
          value = options[key]
          next unless value.present? || !value.to_s.empty?
          if key == :order || key == 'order'
            orders = value.split(' ')
            result = if orders.length == 2
                       result.order("#{orders[0]} #{orders[1].upcase}")
                     else
                       result.order(value)
                     end
          elsif key == :order_max || key.to_s == 'order_max'
            result = result.order(value)
          elsif key.to_s.include?('like_')
            query = ''
            query_value = {}
            attr_key = key.to_s.gsub('like_', '')
            if attr_key.include?('.')
              ref_table = attr_key.split('.')[0]
              ref_key = attr_key.split('.')[1]

              if value.is_a?(Array)
                value.each_with_index do |v, i|
                  query += "#{attr_key} like :value#{i} "
                  query += 'or ' if i != value.length-1
                  query_value.merge!({"value#{i}": "%#{v}%"})
                end
                result = result.where(query, query_value)
              else
                result = result.where("#{attr_key} like ?", "%#{value}%")
              end
            else
              if value.is_a?(Array)
                value.each_with_index do |v, i|
                  query += "#{self.name.tableize}.#{attr_key} like :value#{i} "
                  query += 'or ' if i != value.length-1
                  query_value.merge!({"value#{i}": "%#{v}%"})
                end
                result = result.where(query, query_value)
              else
                result = result.where("#{self.name.tableize}.#{attr_key} like ?", "%#{value}%") if self.attribute_names.include?(attr_key)
              end
            end

            # or || 兼容   'students.creator_id'的情况发生   可能传递多个，超过两个
          elsif key.to_s =~ /^or_/
            attr_key = key.to_s.gsub('or_', '')
            values = value.split(' ')

            if attr_key.include?('.')
              search_key = "#{attr_key}" if value.present?
            else
              search_key = "#{self.name.tableize}.#{attr_key}" if self.attribute_names.include?(attr_key) && value.present?
            end

            query_string = ''
            values.each_with_index do |v, i|
              query_string += "#{search_key} = '#{values[i]}' or "
            end
            query_string.chomp!(' or ')

            result = result.where(query_string)

            # or一个value同时搜多个参数
          elsif key.to_s.include?('&or&')
            # 这边的需求是搜索学校、代理、学生等的拼音名 所以需要同时搜name和name_pinyin 暂时默认是直接需要like的
            # 格式: 'schools.name&or&schools.full_name'
            attr_keys = key.to_s.split('&or&')
            if value.present?
              # query_string = ''
              query_hash = if value.class == Fixnum
                             {value: "#{value.to_s}"}
                           else
                             {value: "%#{value.to_s.upcase}%"}
                           end
              query_string = attr_keys.map.with_index do |attr_key, i|
                convert_key = if attr_key.include?('.')
                                attr_key
                              else
                                "#{self.name.tableize}.#{attr_key}" if self.attribute_names.include?(attr_key)
                              end
                convert_key_arr = convert_key.split('.')
                # 用self的话会有问题
                key_type = convert_key_arr.first.classify.constantize.type_for_attribute(convert_key_arr.last).type.to_s.classify
                key_type == String.name ? "upper(#{convert_key}) like :value or " : "#{convert_key} = :value or "
              end.flatten.join[0..-5]
              result = result.where(query_string, query_hash)
            end
          elsif key.to_s =~ /^compare_/
            attr_key = key.to_s.gsub(/^compare_/, '')
            if value.present?
              query_hash = {}
              query_string = ""
              if attr_key =~ /^lt_/
                attr_key.gsub!(/^lt_/, '')
                convert_key = if attr_key.include?('.')
                                attr_key
                              else
                                "#{self.name.tableize}.#{attr_key}" if self.attribute_names.include?(attr_key)
                              end
                query_hash = {value: "#{value.to_d}"}
                query_string = "#{convert_key} <= :value "
              elsif attr_key =~ /^bt_/
                attr_key.gsub!(/^bt_/, '')
                convert_key = if attr_key.include?('.')
                                attr_key
                              else
                                "#{self.name.tableize}.#{attr_key}" if self.attribute_names.include?(attr_key)
                              end
                query_hash = {min: "#{value.split(' ')[0]}", max: "#{value.split(' ')[1]}"}
                query_string = "#{convert_key} >= :min and #{convert_key} <= :max "
              elsif attr_key =~ /^gt_/
                attr_key.gsub!(/^gt_/, '')
                convert_key = if attr_key.include?('.')
                                attr_key
                              else
                                "#{self.name.tableize}.#{attr_key}" if self.attribute_names.include?(attr_key)
                              end
                query_hash = {value: "#{value.to_d}"}
                query_string = "#{convert_key} >= :value "
              end
              result = result.where(query_string, query_hash)
            end

            # between_and 搜索类似开学日期这样的字段，因为在school_course_infos和professions里面都保存了。
            # 而且按照正常逻辑professions里面保存了，school_course_infos里面不应该还有数据，但是老数据存在这样的情况
            # 实例 根据开学日期搜索  'between_school_course_infos_and_professions.school_start_date' 参数是'2017-01-01 2017-12-12'
          elsif key.to_s.include?('between_') && key.to_s.include?('_and_')
            # 拼接参数
            values = value.split(' ')
            key_array = key.split('.')
            search_column = key_array&.last
            search_tables = key_array&.first&.remove('between_').split('_and_').map { |x| "#{x}.#{search_column} between :first and :last"}.join(' OR ')

            result = result.where("#{search_tables}", first: values.first, last: values.last)

            #between
          elsif key.to_s.include?('between_')
            attr_key = key.to_s.gsub('between_', '')
            front, back = value.split(' ')
            # 这里需要兼容只填写了一个日期的情况
            if (front =~ /^\d{4}\/\d{1,2}\/\d{1,2}$/ || front =~ /^\d{4}-\d{2}-\d{2}$/) && value[-1].blank?
              convert_key = if attr_key.include?('.')
                              attr_key
                            else
                              "#{self.name.tableize}.#{attr_key}" if self.attribute_names.include?(attr_key)
                            end
              query_hash = {value: "#{front.to_date.midnight}"}
              query_string = "#{convert_key} >= :value "
              result = result.where(query_string, query_hash)
            elsif (front =~ /^\d{4}\/\d{1,2}\/\d{1,2}$/ || front =~ /^\d{4}-\d{2}-\d{2}$/) && value[0].blank?
              convert_key = if attr_key.include?('.')
                              attr_key
                            else
                              "#{self.name.tableize}.#{attr_key}" if self.attribute_names.include?(attr_key)
                            end
              query_hash = {value: "#{front.to_date.end_of_day}"}
              query_string = "#{convert_key} <= :value "
              result = result.where(query_string, query_hash)
            else
              if (front =~ /^\d{4}\/\d{1,2}\/\d{1,2}$/ && back =~ /^\d{4}\/\d{1,2}\/\d{1,2}$/) || (front =~ /^\d{4}-\d{2}-\d{2}$/ && back =~ /^\d{4}-\d{2}-\d{2}$/)
                front = front.to_date.midnight
                back = back.to_date.end_of_day
              end
              if attr_key.include?('.')
                result = result.between_fields("#{attr_key}", front, back) if value.present? && value.split(' ').length == 2
              else
                result = result.between_fields("#{self.name.tableize}.#{attr_key}", front, back) if self.attribute_names.include?(attr_key) && value.present? && value.split(' ').length == 2
              end
            end
          elsif key.to_s.include?('not_')
            attr_key = key.to_s.gsub('not_', '')
            result = result.where.not("#{attr_key} = ?", "#{value}")
          else
            key = key.to_s.remove('between_').remove('like_').remove('not_')
            if key.include?('.')
              result = result.where(key.to_sym => value)
            else
              result = result.where("#{self.name.tableize}.#{key}".to_sym => value) if self.attribute_names.include?(key)
            end
          end
        end
      end
      result
    end
  end

end