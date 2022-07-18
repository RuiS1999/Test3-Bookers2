class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books

  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to  user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
      if @user.update(user_params)
        redirect_to user_path
      else
        render :edit
      end
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
