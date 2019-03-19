# == Schema Information
#
# Table name: shops
#
#  id                 :integer          not null, primary key
#  name               :string                                 # 店铺名称
#  user_id            :integer                                # 用户id
#  phone              :string                                 # 客服电话
#  logo               :string                                 # 店铺Logo
#  status             :string                                 # 状态
#  state_id           :integer                                # 洲
#  country_id         :integer                                # 国家
#  province_id        :integer                                # 省
#  city_id            :integer                                # 市
#  system_language_id :integer                                # 系统语言id
#  deleted_at         :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  qq_number          :string                                 # qq号码
#

class Shop < ApplicationRecord

  has_many :products

  include BaseModelConcern

  def self.create_by_params(params)
    model = nil
    response = Response.rescue do |res|
      user = params[:user]
      create_params = params.require(:create).permit!
      create_params[:user_id] = user&.id
      model = Shop.new(create_params)
      model.save!
    end
    return response, model
  end


  def self.update_by_params(params)
    model = nil
    response = Response.rescue do |res|
      model_id = params[:id]
      res.raise_error("缺少参数") if model_id.blank?

      model = Shop.find(model_id)
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
      models = Shop.search_by_params(search_param).page(page).per(per)
    end
    return response, models
  end

  def self.delete_by_params(params)
    model = nil
    response = Response.rescue do |res|
      model_id = params[:model_id]
      res.raise_error("参数缺失") if model_id.blank?
      model = Shop.find(model_id)
      res.raise_data_miss_error("date doesn't exist") if model.blank?
      model.destroy!
    end
    return response, model
  end
end
