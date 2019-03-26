class Api::ProductsController < ApplicationController
  def index
    @response, @models = Product.query_by_params params
  end

  def create
    @response, @model = Product.create_by_params params
  end

  def update
    @response, @model = Product.update_by_params params
  end

  def destroy
    @response, @model = Product.delete_by_params params
  end

  # 添加商品SKU属性
  def add_variant_property
    @response, @model = ProductVariantProperty.create_by_params params
  end

  # 添加商品SKU属性
  def search_variant_property
    @response, @models = ProductVariantProperty.query_by_params params
  end

end