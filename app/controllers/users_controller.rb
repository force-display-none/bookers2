class UsersController < ApplicationController
  def home
  	  @book = Book.new
      @user = current_user
      @books = Book.all.order(created_at: :ASC)
  end

  def new
  end

  def create
  	  # book = book.new(book_params)
     #  book.save
     #  redirect_to '/books/index'
  end


  def index
  	@book = Book.new
  end

  private
  def book_params
  	  params.require(:book).permit(:title, :body)
  end
end
