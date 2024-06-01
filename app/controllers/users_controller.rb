class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @user_current = User.find(current_user.id)
    @books = @user.books
  end

  def index
    @book = Book.new
    @users = User.all
    @user_current = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
  unless @user.id == current_user.id
    redirect_to user_path(current_user)
  end

  end


private

def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
end


end