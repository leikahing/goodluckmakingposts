class SessionsController < ApplicationController

  skip_before_filter :require_login

  layout 'login'

  def create
    if user = User.find_by_email( params[:email] ).try( :authenticate, params[:password] )
      session[:user_id] = user.id
      redirect_to home_url
    else
      flash.now[:error] ="Username/password combination not recognized."
      render :new
    end
  end
end
