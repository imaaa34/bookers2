class UsersController < ApplicationController

  def show
  end

  def index
    @user = User.find(current_user.id)
    @users = User.all
  end

end
