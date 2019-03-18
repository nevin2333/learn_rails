class Api::ChangePointRulesController < ApplicationController
  def index
    @response, @models = ChangePointRule.query_by_params params
  end

  def create
    @response, @model = ChangePointRule.create_by_params params
  end

  def update
    @response, @model = ChangePointRule.update_by_params params
  end

  def destroy
    @response, @model = ChangePointRule.delete_by_params params
  end
end