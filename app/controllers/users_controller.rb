class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
