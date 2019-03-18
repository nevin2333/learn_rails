# == Schema Information
#
# Table name: inventory_skus
#
#  id                  :integer          not null, primary key
#  name                :string                                 # 名称
#  name_en             :string                                 # 英文名称
#  status              :string                                 # 状态
#  price               :integer                                # 售价
#  costing             :integer                                # 成本
#  price_unit          :string                                 # 货币单位
#  actual_weight       :integer                                # 净重
#  package_weight      :integer                                # 包装后重量
#  publish_weight      :integer                                # 物流毛重
#  weight_unit         :string                                 # 重量单位
#  package_length      :integer                                # 包装后长
#  package_width       :integer                                # 包装后宽
#  package_height      :integer                                # 包装后高
#  volume              :integer                                # 体积
#  volume_unit         :string                                 # 体积单位
#  volume_weight       :string                                 # 体积重
#  inventory_quantity  :integer                                # 库存
#  sales_quantity      :integer                                # 销售量
#  inventory_threshold :integer                                # 库存预警值
#  deleted_at          :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class InventorySku < ApplicationRecord

  include BaseModelConcern

  def self.create_by_params(params)
    model = nil
    response = Response.rescue do |res|
      user = params[:user]
      create_params = params.require(:create).permit!
      create_params[:user_id] = user&.id
      model = InventorySku.new(create_params)
      model.save!
    end
    return response, model
  end


  def self.update_by_params(params)
    model = nil
    response = Response.rescue do |res|
      model_id = params[:id]
      res.raise_error("缺少参数") if model_id.blank?

      model = InventorySku.find(model_id)
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
      models = InventorySku.search_by_params(search_param).page(page).per(per)
    end
    return response, models
  end

  def self.delete_by_params(params)
    model = nil
    response = Response.rescue do |res|
      model_id = params[:model_id]
      res.raise_error("参数缺失") if model_id.blank?
      model = InventorySku.find(model_id)
      res.raise_data_miss_error("date doesn't exist") if model.blank?
      model.destroy!
    end
    return response, model
  end

end
