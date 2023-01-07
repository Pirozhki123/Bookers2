class BooksController < ApplicationController
  def index
    @user = current_user
    @books = Book.all
  end

  def show
  end

  def edit
  end

  def new
    @book = Book.new
  end

end
