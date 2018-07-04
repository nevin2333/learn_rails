class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  # 屏蔽CSRF攻击
  skip_before_action :verify_authenticity_token

end
