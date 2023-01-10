class BooksController < ApplicationController
  before_action :is_matching_login_user_on_book, only: [:edit, :update]

  def is_matching_login_user_on_book
    book_id = Book.find(params[:id]).user.id
    unless book_id == current_user.id
      redirect_to books_path
    end
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @bookdetail = Book.find(params[:id])
    @user = @bookdetail.user
    @book = Book.new
    @books = Book.all
  end

  def edit

    @book = Book.find(params[:id])
  end

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice]="You have created book successfully."
      redirect_to '/books'
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]="You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
