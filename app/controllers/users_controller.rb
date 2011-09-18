class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create]
  layout 'login'
  helper_method :user

  def new
    session[:user_id] = nil
  end

  def create
    if user.save
      session[:user_id] = user.id
      redirect_to home_url
    else
      render :new
    end
  end

  def update
    if user.update_attributes params[:user]
      redirect_to home_url
    else
      render :edit
    end
  end

  private

  def user
    @user ||= if current_user
      current_user
    else
      User.new params[:user]
    end
  end
end
