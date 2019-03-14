# == Schema Information
#
# Table name: shops
#
#  id                 :integer          not null, primary key
#  name               :string                                 # 店铺名称
#  user_id            :integer                                # 用户id
#  qq_number          :integer                                # 客服QQ
#  phone              :string                                 # 客服电话
#  logo               :string                                 # 店铺Logo
#  status             :string                                 # 状态
#  state_id           :integer                                # 洲
#  country_id         :integer                                # 国家
#  province_id        :integer                                # 省
#  city_id            :integer                                # 市
#  system_language_id :integer                                # 系统语言id
#  deleted_at         :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Shop < ApplicationRecord
  # log_in
  def self.sign_in(params)
    response = Response.rescue do |_res|
    end
    response
  end
end
