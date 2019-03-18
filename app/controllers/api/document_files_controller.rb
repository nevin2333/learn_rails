class Api::DocumentCategoriesController < ApplicationController
  def index
    @response, @models = DocumentCategory.query_by_params params
  end

  def create
    @response, @model = DocumentCategory.create_by_params params
  end

  def update
    @response, @model = DocumentCategory.update_by_params params
  end

  def destroy
    @response, @model = DocumentCategory.delete_by_params params
  end
end