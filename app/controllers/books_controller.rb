class BooksController < ApplicationController



  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book)
    else
      @books = Book.all
      @user_current = User.find(current_user.id)
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user_current = User.find(current_user.id)
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @user_current = User.find(current_user.id)
  end

  def edit
  book = Book.find(params[:id])
  unless book.user.id == current_user.id
    redirect_to books_path
  end

    @book = Book.find(params[:id])

  end

  def update
    book = Book.find(params[:id])
  unless book.user.id == current_user.id
    redirect_to book_path(@book.id)
  end
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private



  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end
end
