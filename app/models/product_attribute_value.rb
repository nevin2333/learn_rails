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

end
