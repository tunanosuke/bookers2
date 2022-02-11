class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
  end

  def show
    @user_books = current_user.books
  end
end
