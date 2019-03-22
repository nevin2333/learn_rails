class Api::ProductAttributesController < ApplicationController
  def index
    @response, @models = ProductAttribute.query_by_params params
  end

  def create
    @response, @model = ProductAttribute.create_by_params params
  end

  def update
    @response, @model = ProductAttribute.update_by_params params
  end

  def destroy
    @response, @model = ProductAttribute.delete_by_params params
  end
end