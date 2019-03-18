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
  def self.sign_in(params)
    response = Response.rescue do |_res|
    end
    response
  end
end
