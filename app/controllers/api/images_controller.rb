class Api::ImagesController < ApplicationController
  def index
    @response, @models = Image.query_by_params params
  end

  def create
    @response, @model = Image.create_by_params params
  end

  def update
    @response, @model = Image.update_by_params params
  end

  def destroy
    @response, @model = Image.delete_by_params params
  end

  def upload
    @response, @image = Image.upload_by_params params
  end
end