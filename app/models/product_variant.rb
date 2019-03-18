# == Schema Information
#
# Table name: product_variants
#
#  id                        :integer          not null, primary key
#  name                      :string                                 # 名称
#  name_en                   :string                                 # 英文名称
#  product_id                :integer                                # 商品id
#  art_no                    :string                                 # 货号
#  status                    :string                                 # 状态
#  seq                       :integer                                # 顺序
#  sku_property_values       :string                                 # 商品SKU属性值
#  put_on_shelves_time       :datetime                               # 上架时间
#  put_off_shelves_time      :datetime                               # 下架时间
#  first_put_on_shelves_time :datetime                               # 商品首次上架时间
#  inventory_sku_id          :integer                                # 关联库存SKU
#  deleted_at                :datetime
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

class ProductVariant < ApplicationRecord

end
