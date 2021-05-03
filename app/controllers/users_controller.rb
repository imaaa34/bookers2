class UsersController < ApplicationController

  def index
    #user-info
    @user = User.find(current_user.id)
    #new-book
    @book = Book.new
    #users
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def show
    #user-info
    @user = User.find(params[:id])
    #new-book
    @book = Book.new
    #user-detail条件に当てはまるレコードを全て取得
    @books = Book.where(user_id: params[:id])

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
