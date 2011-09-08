class UsersController < ApplicationController
  helper_method :user

  skip_before_filter :require_login, :only => [:new, :create]
  layout 'login'

  def create
    if user.valid?
      session[:user_id] = user.id
      redirect_to home_url
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if user.update_attributes params[:user]
      redirect_to home_url
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
