class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def is_matching_login_user
    user_id =params[:id].to_i
    unless user_id == current_user.id
      redirect_to user_path(current_user)
    end
  end

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
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
