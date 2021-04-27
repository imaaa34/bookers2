class BooksController < ApplicationController

  def index
    #user-info
    @user = User.find(current_user.id)
    #new-book
    @book = Book.new
    #books
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @user = User.find(current_user.id)
    #book-detail
    @bookd = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.permit(:title, :body)
  end

end
