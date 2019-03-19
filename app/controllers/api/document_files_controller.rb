class Api::DocumentFilesController < ApplicationController
  def index
    @response, @models = DocumentFile.query_by_params params
  end

  def create
    @response, @model = DocumentFile.create_by_params params
  end

  def update
    @response, @model = DocumentFile.update_by_params params
  end

  def destroy
    @response, @model = DocumentFile.delete_by_params params
  end
end