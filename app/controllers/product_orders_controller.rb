class ProductOrdersController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @product_order = ProductOrder.new
    @order = current_order
    product_order = @order.product_orders.find_by product_id: product_order_params[:product_id]
    if product_order.presence
      product_order.quantity += product_order_params[:quantity].to_i
      product_order.update_attributes quantity: product_order.quantity
    else
      @product_order = @order.product_orders.build product_order_params
    end
    if @order.save!
    session[:order_id] = @order.id
    end
  end

  def update
    @order = current_order
    @product_order = @order.product_orders.find(params[:id])
    if params[:type] == "inc"
      @product_order.quantity += 1
      @product_order.update_attributes quantity: @product_order.quantity
    elsif params[:type] == "dec"&& (@product_order.quantity > 1)
      @product_order.quantity -= 1
      @product_order.update_attributes quantity: @product_order.quantity
    end
  end

  def destroy
    @product_order = current_order.product_orders.find_by(params[:id])
    @product_order.destroy
  end

  private

  def product_order_params
    params.require(:product_order).permit :quantity, :product_id
  end

end
