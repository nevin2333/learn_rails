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

  has_many :images, as: :resource

  has_many :product_reviews

  belongs_to :brand

  belongs_to :product_measurement_unit

  belongs_to :product_category

  has_and_belongs_to_many :members

  has_and_belongs_to_many :product_labels

  # log_in

  include BaseModelConcern

  def self.create_by_params(params)
    model = nil
    response = Response.rescue do |res|
      user = params[:user]
      create_params = params.require(:create).permit(:name, :name_en, :description, :link, :status,
                                                     :art_no, :product_category_id, :product_measurement_id, :brand_id, :shop_id, :pid,
                                                     product_label_ids: []
      )
      product_label_ids = create_params.delete(:product_label_ids)

      model = Product.new(create_params)
      model.save!

      if product_label_ids.present?
        product_labels = ProductLabel.where(id: product_label_ids)
        model.product_labels = product_labels
      end

    end
    return response, model
  end


  def self.update_by_params(params)
    model = nil
    response = Response.rescue do |res|
      user = params[:user]
      model = Product.find(params[:id])
      res.raise_data_miss_error("data missing") if model.blank?

      update_params = params.require(:update).permit(:name, :name_en, :description, :link, :status,
                                                     :art_no, :product_category_id, :product_measurement_id, :brand_id, :shop_id, :pid,
                                                     product_label_ids: []
      )

      product_label_ids = update_params.delete(:product_label_ids)
      model.update_attributes!(update_params)

      if product_label_ids.present?
        product_labels = ProductLabel.where(id: product_label_ids)
        model.product_labels = product_labels
      end
    end
    return response, model
  end


  def self.query_by_params(params)
    models = nil
    response = Response.rescue do |res|
      page, per, search_param = params[:page] || 1, params[:per] || 5, params[:search]
      search_param = {} if search_param.blank?
      models = Product.eager_load(:images, :brand, :product_labels).search_by_params(search_param).page(page).per(per)
    end
    return response, models
  end

  def self.delete_by_params(params)
    model = nil
    response = Response.rescue do |res|
      model_id = params[:id]
      res.raise_error("参数缺失") if model_id.blank?
      model = Product.find(model_id)
      res.raise_data_miss_error("date doesn't exist") if model.blank?
      model.destroy!
    end
    return response, model
  end

end
