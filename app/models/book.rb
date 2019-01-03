class Book < ApplicationRecord
  has_one_attached :cover_art

  searchkick searchable: [:title, :author, :searchable_text], word_middle: [:title, :author, :searchable_text]

  validates :author, :release_date, :language, presence: true
  validates :title, :presentable_text, :searchable_text, uniqueness: true, presence: true

  def first_1000_words
  	i = 0
  	text = ""

    self.presentable_text.each do |word|
      if word=="Produced"
        i = 0
        text = ""
      end

      text+=word+=" "
      i+=1
      break if i==999
    end

    text
  end
end