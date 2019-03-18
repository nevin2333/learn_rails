class Api::MembersController < ApplicationController
  def index
    @response, @models = Member.query_by_params params
  end

  def create
    @response, @model = Member.create_by_params params
  end

  def update
    @response, @model = Member.update_by_params params
  end

  def destroy
    @response, @model = Member.delete_by_params params
  end
end