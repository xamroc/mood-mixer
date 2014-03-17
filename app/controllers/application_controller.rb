class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def is_authenticated?
    #check session hash for a :user_id (true/false)
    # not session[:user_id].nil?
    # redirect_to login_url if session[:user_id].nil?
    redirect_to login_url unless current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

end
