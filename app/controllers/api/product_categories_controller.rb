class Api::ProductCategoriesController < ApplicationController
  def index
    @response, @models = ProductCategory.query_by_params params
  end

  def create
    @response, @model = ProductCategory.create_by_params params
  end

  def update
    @response, @model = ProductCategory.update_by_params params
  end

  def destroy
    @response, @model = ProductCategory.delete_by_params params
  end
end