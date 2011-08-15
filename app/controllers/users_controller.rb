class UsersController < ApplicationController
  helper_method :user

  skip_before_filter :require_login, :only => [:new, :create]
  layout "login", :only => [ :new, :create ]

  def create
    if user.save
      session[:user_id] = user.id
      redirect_to home_url
    else
      render :new
    end
  end

  def update
    if user.save
      redirect_to users_path(user)
    else
      render :edit
    end
  end

  private

  def user
    @user ||= if params[:id]
      User.find params[:id]
    else
      User.new params[:user]
    end
  end
end
