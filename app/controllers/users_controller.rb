class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = current_user
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
