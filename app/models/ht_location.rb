# == Schema Information
#
# Table name: ht_locations
#
#  id      :integer          not null, primary key
#  pid     :integer                                # 父id
#  path    :string                                 # 路径
#  level   :integer                                # 层级
#  name    :string                                 # 名称
#  name_en :string                                 # 英文名称
#  code    :string                                 # 编码
#

class HtLocation < ApplicationRecord
  # log_in
  def self.sign_in(params)
    response = Response.rescue do |_res|
    end
    response
  end

  def self.execute
    names = ['阿拉伯语', '克罗地亚语', '丹麦语', '希腊语', '爱沙尼亚语', '芬兰语', '爱尔兰语', '匈牙利语', '意大利语', '朝鲜语', '立陶宛语', '挪威语', '葡萄牙语', '罗马尼亚语', '塞尔维亚语', '斯洛文尼亚语', '土耳其语', '中文（简体）', '保加利亚语', '捷克语', '德语', '英语', '西班牙语', '法语', '印地语', '希伯来语', '日语', '拉脱维亚语', '荷兰语', '波兰语', '瑞典语', '俄语' ,'斯洛伐克语' ,'泰语' ,'乌克兰语', '中文（繁体）']
    english_names = ['Arabic', 'Croatian', 'Danish', 'Greek', 'Estonian', 'Finnish', 'Irish', 'Hungarian', 'Italian', 'Korean', 'Lithuania', 'Norwegian', 'Portuguese', 'Romanian', 'Serbian', 'Slovenian', 'Turkish', 'Chinese', 'Bulgarian', 'Czech', 'German', 'English', 'Spanish', 'French', 'Hindi', 'Hebrew', 'Japanese', 'Latvian', 'Dutch', 'Polish', 'Swedish', 'Russian', 'Slovak', 'Thai', 'Ukraine', 'Chinese (Traditional)']
    codes = ['ar-XA', 'hr', 'da', 'el', 'et' ,'fi', 'ga' ,'hu' ,'it', 'ko', 'lt', 'no' ,'pt', 'ro' ,'sr-CS' ,'sl', 'tr' ,'zh-chs' ,'bg' ,'cs' ,'de', 'en' ,'es' ,'fr', 'hi', 'he' ,'ja', 'lv', 'nl', 'pl', 'sv' ,'ru' ,'sk', 'th', 'uk-UA', 'zh-cht']
    names.each_with_index do |name, index|
      SystemLanguage.new(name: name, code: codes[index],name_en: english_names[index] ).save
    end
  end
end
