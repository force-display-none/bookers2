class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index, :show, :edit, :update, :destroy]

  def top
    if user_signed_in?
       redirect_to user_path(current_user)
    end
  end
  def create
  	  @book = Book.new(book_params)
      @user = current_user
      @books = Book.all.order(created_at: :ASC)
      @book.user_id = current_user.id
      # bookモデルのuser_idカラムにログインuserのidを入れている。入れないとshowアクションで紐付かない
  	  if @book.save
      # リダイレクト先を本の詳細にしています(どの本の詳細か指定しています)
  	  redirect_to book_path(@book.id)
      else
      render 'index'
      end
  end

  def about
  end

  def index
  	  @book = Book.new
      @books = Book.all.order(created_at: :ASC)
      @user = current_user
      @users = User.all
  end

  def show
      @book_id = Book.find(params[:id])
      @user = @book_id.user
      @book = Book.new
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])
      @book.update(book_params)
      redirect_to book_path(@book)
  end

  def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path
  end

  private
  def book_params
  	  params.require(:book).permit(:title, :body)
  end

  def user_params
      params.require(:user).permit(:name, :introduction)
  end

end
