class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  # 屏蔽CSRF攻击
  skip_before_action :verify_authenticity_token

  prepend_before_action :get_user

  def get_user

    user_session_key = params[:user_session_key]

    user_string = $redis.get("user_#{user_session_key}")

    if user_string.present?
      json = JSON.parse(user_string)
      user = User.new.from_json(JSON.parse(user_string).to_json)
      params[:user] = user
    end

    if params[:user_id].present?
      params[:user] = User.find_by_id(:user_id)
    end

  end

end
