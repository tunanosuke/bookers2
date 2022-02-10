class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
  end

  def show
    @book = Book.new
    @books = current_user.books
  end
end
