class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :require_login

  def current_user
    if session[:user_id]
      @current_user ||= User.find session[:user_id]
    else
      @current_user
    end
  end

  def require_login
    unless current_user
      redirect_to root_url, notice: "Login required."
    end
  end
end
