class CheckoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_order

  def new; end

  def index
    @address = Address.find(params[:address_id])
  end

  def update
    current_order.product_orders.each do |product_order|
      product = Product.find_by id: product_order.product.id
      quantity = product.quantity - product_order.quantity
      if quantity > 0
        product.update_attribute :quantity, quantity
      else
        flash[:warning] = "San pham #{product_order.product.name} da het hang!"
        redirect_to(checkouts_path) and return
      end
    end
    subtotal = current_order.subtotal
    current_order.update_attribute :total, subtotal
    session.delete(:order_id)
    redirect_to root_path
    flash[:success] = "Checkout successfully!"
  end

end
