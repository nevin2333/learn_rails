# == Schema Information
#
# Table name: members
#
#  id                :integer          not null, primary key
#  name              :string                                 # 名称
#  user_id           :integer                                # 用户id
#  site_id           :integer                                # 站点id
#  foreign_member_id :integer                                # 外部系统会员id
#  deleted_at        :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Member < ApplicationRecord
  # log_in
  def self.sign_in(params)
    response = Response.rescue do |_res|
    end
    response
  end
end
