# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  real_name       :string
#  deleted_at      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  lock_version    :integer
#

class User < ApplicationRecord
  has_secure_password
  # log_in
  def self.sign_in(params)
    user = nil
    response = Response.rescue do |_res|
      username = params[:username]
      password = params[:password]
      user = User.find_by_username(username)&.authenticate(password)
      _res.raise_error('账号和密码不对') if user.blank?
    end
    [response, user]
  end
end
