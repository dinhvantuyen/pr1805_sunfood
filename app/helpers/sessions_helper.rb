module SessionsHelper

  def number_to_currency_br(number)
    number_to_currency(number, :unit => "đ ", :delimiter => ".", precision: 0, format: "%n %u")
  end

  def check_login
    return if user_signed_in?
    flash[:info] = "Login First!"
    session[:forwarding_url] = request.referrer || (request.original_url if request.get?)
    redirect_to new_user_session_path
  end

  def check_order
    return if current_order.product_orders.presence
    flash[:warning] = "Tiếp tục mua sắm nào!"
    redirect_to root_url
  end

end
