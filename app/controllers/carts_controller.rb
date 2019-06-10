class CartsController < ApplicationController
  def index
    @product_orders = current_order.product_orders
  end
end
