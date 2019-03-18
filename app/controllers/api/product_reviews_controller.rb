class Api::ProductReviewsController < ApplicationController
  def index
    @response, @models = ProductReview.query_by_params params
  end

  def create
    @response, @model = ProductReview.create_by_params params
  end

  def update
    @response, @model = ProductReview.update_by_params params
  end

  def destroy
    @response, @model = ProductReview.delete_by_params params
  end
end