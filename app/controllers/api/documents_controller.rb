class Api::DocumentsController < ApplicationController
  def index
    @response, @models = Document.query_by_params params
  end

  def create
    @response, @model = Document.create_by_params params
  end

  def update
    @response, @model = Document.update_by_params params
  end

  def destroy
    @response, @model = Document.delete_by_params params
  end
end