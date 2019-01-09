class BooksController < ApplicationController
  def index
    Book.reindex
    if params[:query].present?
      @books = Book.search(params[:query], fields: [:title, :author, :searchable_text], match: :word_middle, page: params[:page])

      respond_to do |f|
        f.html { redirect_to root_path }
        f.js { render "index.js.erb" }
      end

    else
      @books = Book.all.page params[:page]
      respond_to do |f|
        f.html { redirect_to root_path }
        f.js { render "index.js.erb" }
      end
    end
  end

  def create(book_attributes)
    Book.create(book_attributes)
  end

  def show
    render "show"
  end
end