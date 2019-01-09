class Book < ApplicationRecord
  has_one_attached :cover_art

  searchkick searchable: [:title, :author, :searchable_text], word_middle: [:title, :author, :searchable_text]

  validates :author, :release_date, :language, presence: true
  validates :title, :text, :sample_text, :searchable_text, uniqueness: true, presence: true
end