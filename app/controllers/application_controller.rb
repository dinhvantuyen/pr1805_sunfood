class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  helper_method :current_order
  include SessionsHelper

  def after_sign_in_path_for(resource)
    session[:forwarding_url] || stored_location_for(resource) || root_path
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def current_order
    session[:order_id].present? ? Order.find(session[:order_id]) : Order.new
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone])
  end

  private

  def default_url_options
    {locale: I18n.locale}
  end
end
