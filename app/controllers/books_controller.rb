
class BooksController < ApplicationController
  def index
    Book.reindex
    if params[:query].present?
      @books = Book.search(params[:query], fields: [:title, :author, :searchable_text], match: :word_middle, page: params[:page])
    else
      @books = Book.all.page params[:page]
    end
    
    respond_to do |f|
      f.html { redirect_to root_path }
      f.js { render "index.js.erb" }
    end
  end

  def create(book_attributes)
    Book.create(book_attributes)
  end

  def show
    render "show"
  end

  def kindle_download
    @book = Book.find(params[:id])
    mobifile = @book.mobi.download

    send_data mobifile, filename: @book.title.gsub(" ", '') + '.mobi', type: 'mobi', disposition: 'attachment'
  end

  def txt_download
    @book = Book.find(params[:id])
    send_data @book.text, :filename => @book.title.gsub(" ", '') + '.txt'
  end
end