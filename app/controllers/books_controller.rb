class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  def index
    # N + 1 query
    # chuong trinh chay nhanh hon
    # @books = Book.all
    @books = Book.all.includes(:categories)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params

    if @book.save
      # BookCategory.create(book_id: @book.id, category_id: params[:category_id])
      category_params.each do |category_id|
        @book.book_categories.create(category_id: category_id)
      end
      redirect_to books_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @book.destroy
      redirect_to books_url, notice: 'Book was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:name, :author, :publisher, :price)
    end

    def category_params
      params.require(:category_ids)
    end
end
