class Book < ApplicationRecord
  searchkick

  validates :title, :text, uniqueness: true

  def first_100_words
  	i = 0
  	text = ""

    self.text.each do |word|
      text += word += " "
      i+=1
      break if i==99
    end

    text
  end
  
end