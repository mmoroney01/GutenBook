class BooksController < ApplicationController
  def index
    if params[:query].present?
      @books = Book.search(params[:query], fields: [{searchable_text: :exact}], page: params[:page])
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