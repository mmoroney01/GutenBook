class BooksController < ApplicationController
  def index
    if params[:query].present?
      @books = Book.search(params[:query], page: params[:page])

      # @books = Book.where("'#{params[:query]}' = ANY (text)")
    else
      @books = Book.all.page params[:page]
    end
  end

  def create(book_attributes)
    Book.create(book_attributes)
  end

  def show
    render "show"
  end
end