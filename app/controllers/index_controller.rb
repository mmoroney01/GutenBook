class IndexController < ApplicationController
  def index
  	# words = []
   #  File.open("TheCaskOfAmontillado.txt").each_line do |line|
   #    line.split.each do |word|
   #    	words << word
   #    end
   #  end
   #  p words

  	render 'index'
  end
end
