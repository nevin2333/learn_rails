class Api::ProductsController < ApplicationController
  def index
    @response, @models = Product.query_by_params params
  end

  def create
    @response, @model = Product.create_by_params params
  end

  def update
    @response, @model = Product.update_by_params params
  end

  def destroy
    @response, @model = Product.delete_by_params params
  end
end