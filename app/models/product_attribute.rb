# == Schema Information
#
# Table name: product_attributes
#
#  id                  :integer          not null, primary key
#  name                :string                                 # 名称
#  name_en             :string                                 # 英文名称
#  product_category_id :integer                                # 商品分类id
#  required            :boolean                                # 是否必填
#  visible             :boolean                                # 是否可以发布
#  is_sku              :boolean                                # 是否是sku属性
#  units               :string                                 # 属性值的单位
#  status              :string                                 # 状态
#  deleted_at          :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class ProductAttribute < ApplicationRecord

end
