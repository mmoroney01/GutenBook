class BooksController < ApplicationController
  
  def index
    if params[:query].present?
      @books = Book.search(params[:query], page: params[:page])
    else
      @books = Book.all.page params[:page]
    end
  end

  def create(txt)
    #create a book object using data gleaned from txt file
    book = Book.new(book_attributes(txt))
  end

  def show
    render "show"
  end

  private

  def book_attributes(txt)
    title = ""
    author = ""
    release_date = ""
    language = ""

    #params of open may need to be different depending on source of txt files
    File.open(txt).each do |line|
      if line.match(/^Title: /)
        title = line.gsub(/Title: /, "").gsub(/\n/, "")
      end

      if line.match(/^Author: /)
        author = line.gsub(/Author: /, "").gsub(/\n/, "")
      end

      if line.match(/^Release Date: /)
        release_date = line.gsub(/Release Date: /, "").gsub(/\WEBook #\d{1,}\W/, "").gsub(/\n/, "")
      end

      if line.match(/^Language: /)
        language = line.gsub(/Language: /, "").gsub(/\n/, "")
      end
    end

    {title: title, author: author, release_date: release_date, language: language}
  end
end
