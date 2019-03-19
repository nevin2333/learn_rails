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
#  site_id         :integer                                # 站点id
#  foreign_user_id :integer                                # 外部系统用户id
#

class User < ApplicationRecord
  has_secure_password

  has_many :members
  has_many :shops
  belongs_to :site

  # log_in
  def self.sign_in(params)
    user = nil
    object_key = nil
    response = Response.rescue do |_res|
      username = params[:username]
      password = params[:password]
      user = User.find_by_username(username)
      _res.raise_error('用户不存在') if user.blank?

      _res.raise_error('请输入正确的登录密码') unless user.authenticate(password)

      object_key = Aes.object_encrypt(user.id, 'User').chomp!.delete('+')
      cache_object = user.to_json
      $redis.set("user_#{object_key}", cache_object) # 缓存拼接的user_session_key
      $redis.expire("user_#{object_key}", 720000)
    end
    [response, user, object_key]
  end
end
