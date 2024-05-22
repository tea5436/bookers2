class BooksController < ApplicationController



  def create
    book = Book.new(book_params)
    book.save
    redirect_to '/books'
  end

  def index
    @book = Book.new
    @books = Book.all
  end



  def show
    @book = Book.new
    @book = Book.find(params[:id])
  end


  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

end
