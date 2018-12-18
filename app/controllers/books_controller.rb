class BooksController < ApplicationController
  before_action :logged_in_user, only: [:new]

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      flash[:success] = 'Book was successfully created!'
      redirect_to @book
    else
      render 'new'
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :isbn, :edition, :author, :condition, :price, :course, :professor, :picture)
    end

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
