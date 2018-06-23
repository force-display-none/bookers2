class BooksController < ApplicationController
  def top
  	if user_signed_in?
  		redirect_to '/home'
  	end
  end

  def new
  end


  def create
  	  book = Book.new(book_params)
  	  book.save
  	  redirect_to '/books'
  end

  def about
  end

  def index
  	  @book = Book.new
  end

  private
  def book_params
  	  params.require(:book).permit(:title, :body)
  end
end
