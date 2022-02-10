class BooksController < ApplicationController
  def index
  end

  def new
  end

  def create
    current_user.books.create(book_params)
    redirect_to user_path(current_user)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
