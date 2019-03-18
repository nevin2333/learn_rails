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

end
