class UsersController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @users = User.all
  end

  def show
    #条件に当てはまるレコードを全て取得
    @books = Book.where(user_id: params[:id])
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  #user-update
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
