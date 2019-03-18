# == Schema Information
#
# Table name: change_point_rules
#
#  id      :integer          not null, primary key
#  name    :string
#  name_en :string
#  status  :string
#  point   :integer                                # 积分
#  user_id :integer
#

class ChangePointRule < ApplicationRecord

  # log_in
  def self.sign_in(params)
    response = Response.rescue do |_res|
    end
    response
  end
end
