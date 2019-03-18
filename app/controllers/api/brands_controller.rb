class Api::BrandsController < ApplicationController
  def index
    @response, @models = Brand.query_by_params params
  end

  def create
    @response, @model = Brand.create_by_params params
  end

  def update
    @response, @model = Brand.update_by_params params
  end

  def destroy
    @response, @model = Brand.delete_by_params params
  end
end