# == Schema Information
#
# Table name: product_variants
#
#  id                        :integer          not null, primary key
#  name                      :string                                 # 名称
#  name_en                   :string                                 # 英文名称
#  product_id                :integer                                # 商品id
#  art_no                    :string                                 # 货号
#  status                    :string                                 # 状态
#  seq                       :integer                                # 顺序
#  sku_property_values       :string                                 # 商品SKU属性值
#  put_on_shelves_time       :datetime                               # 上架时间
#  put_off_shelves_time      :datetime                               # 下架时间
#  first_put_on_shelves_time :datetime                               # 商品首次上架时间
#  inventory_sku_id          :integer                                # 关联库存SKU
#  deleted_at                :datetime
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

class ProductVariant < ApplicationRecord
  include BaseModelConcern

  def self.create_by_params(params)
    model = nil
    response = Response.rescue do |res|
      user = params[:user]
      create_params = params.require(:create).permit!
      create_params[:user_id] = user&.id
      model = ProductVariant.new(create_params)
      model.save!
    end
    return response, model
  end


  def self.update_by_params(params)
    model = nil
    response = Response.rescue do |res|
      model_id = params[:id]
      res.raise_error("缺少参数") if model_id.blank?

      model = ProductVariant.find(model_id)
      res.raise_data_miss_error("修改的数据不存在") if model.blank?

      update_params = params.require(:update).permit!
      model.update_attributes!(update_params)
    end
    return response, model
  end


  def self.query_by_params(params)
    models = nil
    response = Response.rescue do |res|
      page, per, search_param = params[:page] || 1, params[:per] || 5, params[:search]
      search_param = {} if search_param.blank?
      models = ProductVariant.search_by_params(search_param).page(page).per(per)
    end
    return response, models
  end

  def self.delete_by_params(params)
    model = nil
    response = Response.rescue do |res|
      model_id = params[:model_id]
      res.raise_error("参数缺失") if model_id.blank?
      model = ProductVariant.find(model_id)
      res.raise_data_miss_error("date doesn't exist") if model.blank?
      model.destroy!
    end
    return response, model
  end
end
