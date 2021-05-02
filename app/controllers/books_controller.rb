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
    #user-info
    @user = User.find(current_user.id)
    #books
    @books = Book.all
    #new-book
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user_id == current_user.id
      redirect_to books_path
    end
  end

  def show
    #book-detail
    @bookd = Book.find(params[:id])
    #user-info
    @user = User.find(@bookd.user_id)
    #new-book
    @book = Book.new
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end