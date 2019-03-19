class Api::SystemLanguagesController < ApplicationController
  def index
    @response, @models = SystemLanguage.query_by_params params
  end
end