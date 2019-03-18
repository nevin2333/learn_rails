# == Schema Information
#
# Table name: brands
#
#  id          :integer          not null, primary key
#  name        :string                                 # 名称
#  name_en     :string                                 # 英文名称
#  description :string                                 # 描述
#  link        :string                                 # 链接
#  logo        :string                                 # 商标
#  status      :string                                 # 状态
#  user_id     :integer                                # 用户id
#  deleted_at  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Brand < ApplicationRecord

  has_many :products

  # log_in
  def self.sign_in(params)
    response = Response.rescue do |_res|
    end
    response
  end
end
