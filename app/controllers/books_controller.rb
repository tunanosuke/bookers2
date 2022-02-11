class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def create
    book = current_user.books.create(book_params)
    redirect_to book_path(book)
  end

  def edit
    @book = current_user.books.find(params[:id])
  end

  def update
    book = current_user.books.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    book = current_user.books.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
