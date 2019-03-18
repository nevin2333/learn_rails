# == Schema Information
#
# Table name: products
#
#  id                     :integer          not null, primary key
#  name                   :string                                 # 名称
#  name_en                :string                                 # 英文名称
#  description            :string                                 # 描述
#  link                   :string                                 # 外部链接
#  status                 :string           default("checking")   # 状态
#  art_no                 :string                                 # 货号
#  product_category_id    :integer                                # 商品分类id
#  product_measurement_id :integer                                # 计量单位id
#  brand_id               :integer                                # 品牌id
#  shop_id                :integer                                # 店铺id
#  pid                    :integer                                # 父级商品id
#  deleted_at             :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Product < ApplicationRecord

  belongs_to :product_label
  belongs_to :brand
  belongs_to :product_measurement_unit
  has_many :product_reviews
  has_and_belongs_to_many :members

  # log_in

  include BaseModelConcern

  def self.create_by_params(params)
    model = nil
    response = Response.rescue do |res|
      user = params[:user]
      create_params = params.require(:create).permit!
      create_params[:user_id] = user&.id
      model = Product.new(create_params)
      model.save!
    end
    return response, model
  end


  def self.update_by_params(params)
    model = nil
    response = Response.rescue do |res|
      model_id = params[:id]
      res.raise_error("缺少参数") if model_id.blank?

      model = Product.find(model_id)
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
      models = Product.search_by_params(search_param).page(page).per(per)
    end
    return response, models
  end

  def self.delete_by_params(params)
    model = nil
    response = Response.rescue do |res|
      model_id = params[:model_id]
      res.raise_error("参数缺失") if model_id.blank?
      model = Product.find(model_id)
      res.raise_data_miss_error("date doesn't exist") if model.blank?
      model.destroy!
    end
    return response, model
  end

end
