class ProductOrdersController < ApplicationController

  def create
    @product_order = ProductOrder.new
    @order = current_order
    @product_order = @order.product_orders.build product_order_params
    if @product_order.save!
      session[:order_id] = @order.id
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def product_order_params
    params.require(:product_order).permit :quantity, :product_id
  end

end
