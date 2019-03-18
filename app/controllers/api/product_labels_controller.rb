class Api::ProductLabelsController < ApplicationController
  def index
    @response, @models = ProductLabel.query_by_params params
  end

  def create
    @response, @model = ProductLabel.create_by_params params
  end

  def update
    @response, @model = ProductLabel.update_by_params params
  end

  def destroy
    @response, @model = ProductLabel.delete_by_params params
  end
end