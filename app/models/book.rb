class Book < ApplicationRecord
  searchkick searchable: [:title, :author, :searchable_text], word_middle: [:title, :author, :searchable_text]

  def search_data
    {
      title: title,
      author: author,
      release_date: release_date,
      language: language,
      presentable_text: presentable_text,
      searchable_text: searchable_text,
    }
  end

  validates :author, :release_date, :language, presence: true
  validates :title, :presentable_text, :searchable_text, uniqueness: true, presence: true

  def first_100_words_after_three_star
  	i = 0
  	text = ""

    self.presentable_text.each do |word|
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