class Book < ApplicationRecord
  searchkick

  validates :author, :release_date, :language, presence: true
  validates :title, :text, uniqueness: true, presence: true

  def first_100_words_after_three_star
  	i = 0
  	text = ""

    self.text.each do |word|
      if word=="***"
        i = 0
        text = ""
      end

      text+=word+=" "
      i+=1
      break if i==99
    end

    text
  end
end