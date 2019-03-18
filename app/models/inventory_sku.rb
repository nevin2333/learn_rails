# == Schema Information
#
# Table name: inventory_skus
#
#  id                  :integer          not null, primary key
#  name                :string                                 # 名称
#  name_en             :string                                 # 英文名称
#  status              :string                                 # 状态
#  price               :integer                                # 售价
#  costing             :integer                                # 成本
#  price_unit          :string                                 # 货币单位
#  actual_weight       :integer                                # 净重
#  package_weight      :integer                                # 包装后重量
#  publish_weight      :integer                                # 物流毛重
#  weight_unit         :string                                 # 重量单位
#  package_length      :integer                                # 包装后长
#  package_width       :integer                                # 包装后宽
#  package_height      :integer                                # 包装后高
#  volume              :integer                                # 体积
#  volume_unit         :string                                 # 体积单位
#  volume_weight       :string                                 # 体积重
#  inventory_quantity  :integer                                # 库存
#  sales_quantity      :integer                                # 销售量
#  inventory_threshold :integer                                # 库存预警值
#  deleted_at          :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class InventorySku < ApplicationRecord

end
