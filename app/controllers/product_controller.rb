class ProductController < ApplicationController
  def index
    @products = Product.order_by_rand.limit(4)
  end

  def show
    @product = Product.find(params[:id])
  end

  def render_json
    @product = Product.find(params[:id])
    id = @product.id
    @json = {
      id: id,
      visualization_in_home: @product.analytics_show_by_id("view_in_home_#{id}"),
      clicks: @product.analytics_show_by_id("view_click_#{id}"),
    }
    render json: @json.to_json
  end
end
