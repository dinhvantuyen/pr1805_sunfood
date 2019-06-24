class CartsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @product_orders = current_order.product_orders
  end
end
