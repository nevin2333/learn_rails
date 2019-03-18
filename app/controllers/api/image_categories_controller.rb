class Api::ImageCategoriesController < ApplicationController
  def index
    @response, @models = ImageCategory.query_by_params params
  end

  def create
    @response, @model = ImageCategory.create_by_params params
  end

  def update
    @response, @model = ImageCategory.update_by_params params
  end

  def destroy
    @response, @model = ImageCategory.delete_by_params params
  end
end