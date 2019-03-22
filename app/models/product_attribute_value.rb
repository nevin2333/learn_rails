# == Schema Information
#
# Table name: product_attribute_values
#
#  id                   :integer          not null, primary key
#  name                 :string                                 # 名称
#  name_en              :string                                 # 英文名称
#  seq                  :integer                                # 显示顺序
#  product_attribute_id :integer                                # 商品属性
#  status               :string                                 # 状态
#  deleted_at           :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class ProductAttributeValue < ApplicationRecord

  include BaseModelConcern

  belongs_to :product_attribute

  def self.create_by_params(params)
    model = nil
    response = Response.rescue do |res|
      create_params = params.require(:create).permit(:name, :name_en, :seq, :product_attribute_id, :status)
      model = ProductAttributeValue.new(create_params)
      model.save!
    end
    return response, model
  end


  def self.update_by_params(params)
    model = nil
    response = Response.rescue do |res|
      model_id = params[:id]
      res.raise_error("缺少参数") if model_id.blank?

      model = ProductAttributeValue.find(model_id)
      res.raise_data_miss_error("修改的数据不存在") if model.blank?

      update_params = params.require(:update).permit(:name, :name_en, :seq, :product_attribute_id, :status)
      model.update_attributes!(update_params)
    end
    return response, model
  end


  def self.query_by_params(params)
    models = nil
    response = Response.rescue do |res|
      page, per, search_param = params[:page] || 1, params[:per] || 5, params[:search]
      search_param = {} if search_param.blank?
      models = ProductAttributeValue.search_by_params(search_param).page(page).per(per)
    end
    return response, models
  end

  def self.delete_by_params(params)
    model = nil
    response = Response.rescue do |res|
      model_id = params[:id]
      res.raise_error("参数缺失") if model_id.blank?
      model = ProductAttributeValue.find(model_id)
      res.raise_data_miss_error("date doesn't exist") if model.blank?
      model.destroy!
    end
    return response, model
  end

end
