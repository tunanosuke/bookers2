class UsersController < ApplicationController
  def index
  end

  def edit
  end

  def show
    @book = Book.new
    @books = current_user.books
  end
end
