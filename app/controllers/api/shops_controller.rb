class Api::ShopsController < ApplicationController
  def index
    @response, @models = Shop.query_by_params params
  end

  def create
    @response, @model = Shop.create_by_params params
  end

  def update
    @response, @model = Shop.update_by_params params
  end

  def destroy
    @response, @model = Shop.delete_by_params params
  end
end