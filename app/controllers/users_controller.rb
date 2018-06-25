class UsersController < ApplicationController
  # def home
  	  # @book = Book.new
      # @user = current_user
      # @book.user_id = @user.id
      # @books = @user.books
  # end

  def new
  end

  def create
  	  # book = book.new(book_params)
     #  book.save
     #  redirect_to '/books/index'
  end

  def show
      @book = Book.new
      @user = User.find(params[:id])
      @book.user_id = @user.id
      @books = @user.books
  end
  def index
      @user = current_user
  	  @book = Book.new
      @users = User.all
  end

  def edit
      @book = Book.new
      @user = User.find(params[:id])
      @books = @user.books
      if @user != current_user
         redirect_to user_path(current_user)
      end
      @user = User.find(params[:id])
  end

  def update
      @user = current_user
      @user.update(user_params)
      redirect_to user_path(current_user)
  end

  private
  def user_params
      params.require(:user).permit(:name, :introduction, :user_image_id)
  end

  def book_params
  	  params.require(:book).permit(:title, :body)
  end
end
