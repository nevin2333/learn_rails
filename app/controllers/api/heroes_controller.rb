class Api::HeroesController < ApplicationController
  def index
    @response, @heroes = Hero.query_by_params params
  end
end