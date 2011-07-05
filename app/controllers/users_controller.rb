class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]
end
