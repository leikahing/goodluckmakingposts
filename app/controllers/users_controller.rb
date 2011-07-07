class UsersController < ApplicationController

  skip_before_filter :require_login, :only => [:new, :create]

  def new
    @user = User.new params[:user]
  end

  def create
    @user = User.new params[:user]
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_url
    else
      render :new
    end
  end
end
