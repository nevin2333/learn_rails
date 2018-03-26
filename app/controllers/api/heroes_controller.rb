class Api::HeroesController < ApplicationController
  # 屏蔽CSRF攻击
  # skip_before_action :verify_authenticity_token

  def index
    @response, @heroes = Hero.query_by_params params
  end

  def update
    @response, @hero = Hero.update_by_params params
  end
end