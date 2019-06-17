module SessionsHelper

  def check_login
    return if user_signed_in?
    flash[:info] = "Login First!"
    session[:forwarding_url] = request.referrer || (request.original_url if request.get?)
    redirect_to new_user_session_path
  end

end
