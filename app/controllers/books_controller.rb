class BooksController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
    @book = Book.new
  end
end
