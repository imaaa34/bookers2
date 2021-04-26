class UsersController < ApplicationController

  def show
    #条件に当てはまるレコードを全て取得
    @books = Book.where(user_id: params[:id])
    @user = User.find(params[:id])
  end

  def index
    @user = User.find(current_user.id)
    @users = User.all
  end

  #user-update
  def edit
  
  end

end
