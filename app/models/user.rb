# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string
#  password   :string
#  real_name  :string
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  # log_in
  def self.sign_in(params)
    user = nil
    response = Response.rescue do |_res|
      username = params[:username]
      password = params[:password]
      user = User.where(username: username).first
      _res.raise_error('没有这个账号') if user.blank?
      _res.raise_error('密码不对') if user.password != password
    end
    [response, user]
  end
end
