class AnalyticsController < ApplicationController
  def index
    @products = Product.all
  end
end
