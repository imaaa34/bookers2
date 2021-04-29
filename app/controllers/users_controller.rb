class UsersController < ApplicationController

  def index
    @user = User.find(current_user.id)
    #new-book
    @book = Book.new
    @users = User.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
  end

  def show
    @book = Book.new
    #条件に当てはまるレコードを全て取得
    @books = Book.where(user_id: params[:id])
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    unless params[:id].to_i == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  #user-update
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

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
