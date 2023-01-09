class BooksController < ApplicationController
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
    @book.update(book_params)
    flash[:notice]="You have updated book successfully."
    redirect_to book_path(@book)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
