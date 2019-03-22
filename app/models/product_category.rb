# == Schema Information
#
# Table name: product_categories
#
#  id         :integer          not null, primary key
#  name       :string                                 # 名称
#  name_en    :string                                 # 英文名称
#  pid        :integer                                # 父级id
#  path       :string                                 # 路径
#  level      :integer                                # 层级
#  link       :string                                 # 链接
#  seq        :integer                                # 顺序
#  icon       :string                                 # 小图标
#  image      :string                                 # 大图
#  status     :string                                 # 状态
#  user_id    :integer                                # 用户id
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductCategory < ApplicationRecord
  include BaseModelConcern

  mount_uploader :icon, FileUploader

  mount_uploader :image, FileUploader

  belongs_to :parent, class_name: 'ProductCategory', foreign_key: :pid

  has_many :children, class_name: 'ProductCategory', foreign_key: :pid, dependent: :destroy

  has_many :product_attributes

  def self.create_by_params(params)
    model = nil
    response = Response.rescue do |res|
      user = params[:user]
      create_params = params.require(:create).permit(:name, :name_en, :pid, :path, :level, :link,
                                                     :seq, :icon, :image, :status, :user_id)
      create_params[:user_id] = user&.id
      model = ProductCategory.new(create_params)
      model.save!
    end
    return response, model
  end


  def self.update_by_params(params)
    model = nil
    response = Response.rescue do |res|
      model_id = params[:id]
      res.raise_error("缺少参数") if model_id.blank?

      model = ProductCategory.find(model_id)
      res.raise_data_miss_error("修改的数据不存在") if model.blank?

      update_params = params.require(:update).permit(:name, :name_en, :pid, :path, :level, :link,
                                                     :seq, :icon, :image, :status, :user_id)

      update_params.delete(:icon) if update_params[:logo].class.name == 'String'

      update_params.delete(:image) if update_params[:logo].class.name == 'String'

      model.update_attributes!(update_params)
    end
    return response, model
  end


  def self.query_by_params(params)
    models = nil
    response = Response.rescue do |res|
      page, per, search_param = params[:page] || 1, params[:per] || 5, params[:search]
      search_param = {} if search_param.blank?
      models = ProductCategory.eager_load(product_attributes: :product_attribute_values).search_by_params(search_param).page(page).per(per)
    end
    return response, models
  end

  def self.delete_by_params(params)
    model = nil
    response = Response.rescue do |res|
      model_id = params[:id]
      res.raise_error("参数缺失") if model_id.blank?
      model = ProductCategory.find(model_id)
      res.raise_data_miss_error("date doesn't exist") if model.blank?
      model.destroy!
    end
    return response, model
  end

end
