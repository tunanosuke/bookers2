class UsersController < ApplicationController
  before_action :check_current_user, only: [:edit, :update]

  def index
    @users = User.all
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'successfully'
    else
      flash.now[:danger] = @user.errors.full_messages.join('<br>')
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @user_books = @user.books
  end

  private

  def check_current_user
    return redirect_to user_path(current_user) unless User.find(params[:id]) == current_user
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
