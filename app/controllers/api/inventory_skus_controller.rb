class Api::InventorySkusController < ApplicationController
  def index
    @response, @models = InventorySku.query_by_params params
  end

  def create
    @response, @model = InventorySku.create_by_params params
  end

  def update
    @response, @model = InventorySku.update_by_params params
  end

  def destroy
    @response, @model = InventorySku.delete_by_params params
  end
end