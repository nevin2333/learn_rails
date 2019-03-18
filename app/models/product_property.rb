# == Schema Information
#
# Table name: product_properties
#
#  id                         :integer          not null, primary key
#  name                       :string                                 # 名称
#  name_en                    :string                                 # 英文名称
#  value                      :string                                 # 商品属性值
#  seq                        :integer                                # 展示顺序
#  product_attribute_id       :integer                                # 系统内置属性id
#  product_attribute_value_id :integer                                # 系统内置属性值
#  product_id                 :integer                                # 商品id
#  deleted_at                 :datetime
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

class ProductProperty < ApplicationRecord

end
