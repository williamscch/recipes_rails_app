class UsersController < ApplicationController
  def index
    @users = User.all
    @current = current_user
  end

  def show
    @user = current_user
  end
end
