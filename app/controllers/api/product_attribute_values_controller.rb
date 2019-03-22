class Api::ProductAttributeValuesController < ApplicationController
  def index
    @response, @models = ProductAttributeValue.query_by_params params
  end

  def create
    @response, @model = ProductAttributeValue.create_by_params params
  end

  def update
    @response, @model = ProductAttributeValue.update_by_params params
  end

  def destroy
    @response, @model = ProductAttributeValue.delete_by_params params
  end
end