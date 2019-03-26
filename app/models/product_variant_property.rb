# == Schema Information
#
# Table name: product_variant_properties
#
#  id                         :integer          not null, primary key
#  name                       :string                                 # 名称
#  name_en                    :string                                 # 英文名称
#  value                      :string                                 # 商品属性值
#  seq                        :integer                                # 展示顺序
#  product_attribute_id       :integer                                # 系统内置属性id
#  product_attribute_value_id :integer                                # 系统内置属性值id
#  product_id                 :integer                                # 商品id
#  product_variant_id         :integer                                # 商品SKU的id
#  deleted_at                 :datetime
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

class ProductVariantProperty < ApplicationRecord
  include BaseModelConcern

  def self.create_by_params(params)
    model = nil
    response = Response.rescue do |res|
      user = params[:user]
      create_params = params.require(:create).permit(:name, :name_en, :value, :seq, :product_attribute_id, :product_attribute_value_id,
                                                 :product_id, :product_variant_id
      )
      model = ProductVariantProperty.new(create_params)
      model.save!
    end
    return response, model
  end


  def self.update_by_params(params)
    model = nil
    response = Response.rescue do |res|
      model_id = params[:id]
      res.raise_error("缺少参数") if model_id.blank?

      model = ProductVariantProperty.find(model_id)
      res.raise_data_miss_error("修改的数据不存在") if model.blank?

      update_params = params.require(:update).permit(:name, :name_en, :value, :seq, :product_attribute_id, :product_attribute_value_id,
                                                     :product_id, :product_variant_id
      )
      model.update_attributes!(update_params)
    end
    return response, model
  end


  def self.query_by_params(params)
    models = nil
    response = Response.rescue do |res|
      page, per, search_param = params[:page] || 1, params[:per] || 5, params[:search]
      search_param = {} if search_param.blank?
      models = ProductVariantProperty.search_by_params(search_param).page(page).per(per)
    end
    return response, models
  end

  def self.delete_by_params(params)
    model = nil
    response = Response.rescue do |res|
      model_id = params[:id]
      res.raise_error("参数缺失") if model_id.blank?
      model = ProductVariantProperty.find(model_id)
      res.raise_data_miss_error("date doesn't exist") if model.blank?
      model.destroy!
    end
    return response, model
  end
end
