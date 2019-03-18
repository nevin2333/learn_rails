class Api::ProductMeasurementUnitsController < ApplicationController
  def index
    @response, @models = ProductMeasurementUnit.query_by_params params
  end

  def create
    @response, @model = ProductMeasurementUnit.create_by_params params
  end

  def update
    @response, @model = ProductMeasurementUnit.update_by_params params
  end

  def destroy
    @response, @model = ProductMeasurementUnit.delete_by_params params
  end
end