class Api::TasksController < ApplicationController

  def index
    @response, @task = Task.query_by_params params
  end

  def update
    @response, @task = Task.update_by_params params
  end

  def new
    @response, @task = Task.create_by_params params
  end
end