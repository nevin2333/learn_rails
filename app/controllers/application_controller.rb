class ApplicationController < ActionController::Base

  # 屏蔽CSRF攻击
  skip_before_action :verify_authenticity_token

  protect_from_forgery with: :exception
end
