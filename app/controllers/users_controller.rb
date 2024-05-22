class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @users = User.all
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end
end


def user_params
    params.require(:user).permit(:name, :profile_image)
end