# == Schema Information
#
# Table name: brands
#
#  id          :integer          not null, primary key
#  name        :string                                 # 名称
#  name_en     :string                                 # 英文名称
#  description :string                                 # 描述
#  link        :string                                 # 链接
#  logo        :string                                 # 商标
#  status      :string                                 # 状态
#  user_id     :integer                                # 用户id
#  deleted_at  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Brand < ApplicationRecord
  include BaseModelConcern

  has_many :products

  def self.create_by_params(params)
    model = nil
    response = Response.rescue do |res|
      user = params[:user]
      create_params = params.require(:create).permit!
      create_params[:user_id] = user&.id
      model = Brand.new(create_params)
      model.save!
    end
    return response, model
  end


  def self.update_by_params(params)
    model = nil
    response = Response.rescue do |res|
      model_id = params[:id]
      res.raise_error("缺少参数") if model_id.blank?

      model = Dictionary.find(model_id)
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
      models = Brand.search_by_params(search_param).page(page).per(per)
    end
    return response, models
  end

  def self.delete_by_params(params)
    model = nil
    response = Response.rescue do |res|
      model_id = params[:model_id]
      res.raise_error("参数缺失") if model_id.blank?
      model = Brand.find(model_id)
      res.raise_data_miss_error("date doesn't exist") if model.blank?
      model.destroy!
    end
    return response, model
  end

end
