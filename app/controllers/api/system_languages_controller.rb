class Api::SystemLanguagesController < ApplicationController
  def index
    @response, @models = SystemLanguage.query_by_params params
  end

  def create
    @response, @model = SystemLanguage.create_by_params params
  end

  def update
    @response, @model = SystemLanguage.update_by_params params
  end

  def destroy
    @response, @model = SystemLanguage.delete_by_params params
  end
end