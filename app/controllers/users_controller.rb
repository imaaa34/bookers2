class UsersController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @users = User.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
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
