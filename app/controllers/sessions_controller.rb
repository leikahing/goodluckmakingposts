class SessionsController < ApplicationController

  skip_before_filter :require_login

  layout 'login'

  def create
    if user = User.find_by_name( params[:name] ).try( :authenticate, params[:password] )
      session[:user_id] = user.id
      redirect_to home_url
    else
      flash.now[:error] ="Username/password combination not recognized."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_url
  end
end
