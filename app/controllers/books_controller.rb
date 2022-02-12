class BooksController < ApplicationController
  before_action :check_current_user, only: [:edit, :update]

  def index
    @books = Book.all
    @user = current_user
  end

  def create
    book = current_user.books.build(book_params)
    if book.save
      redirect_to book_path(book), notice: 'successfully'
    else
      redirect_to books_path, flash: {danger: book.errors.full_messages.join('<br>')}
    end
  end

  def edit
    @book = current_user.books.find(params[:id])
  end

  def update
    @book = current_user.books.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: 'successfully'
    else
       flash.now[:danger] = @book.errors.full_messages.join('<br>')
      render :edit
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def destroy
    book = current_user.books.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def check_current_user
    return redirect_to books_path unless Book.find(params[:id]).user == current_user
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
