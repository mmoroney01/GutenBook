class BooksController < ApplicationController
  def create
  	#create a book object using data gleaned from txt file

    #params of open may need to be different depending on source of txt files

  	#maybe this should be a private method (get_book_attributes taking a txt file as an argument/returning a hash of book data to easily create a book object)

  	title = ""
  	author = ""
  	release_date = ""
  	language = ""
    
    File.open("EurekaAProsePoem.txt").each do |line|
  	  #some titles might be on multiple lines, how to account? come back to this
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

  	book = Book.new(title: title, author: author, release_date: release_date, language: language)

    p book
  end

  def show
    @book = Book.find(params[:id])

  	render "show"
  end
end
