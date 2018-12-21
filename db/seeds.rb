# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def book_attributes(txt)
    title = ""
    author = ""
    release_date = ""
    language = ""
    text = []

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

      line.split.each do |word|
        text << word
      end
    end

    return {title: title, author: author, release_date: release_date, language: language, text: text}
  end

txt = ["TheCaskOfAmontillado.txt", "TheFallOfTheHouseOfUsher.txt", "TheRaven.txt", "TheMasqueOfTheRedDeath.txt", "EurekaAProsePoem.txt"]

txt.each do |txt|
  book_hash = book_attributes(txt)
  book = Book.create(book_hash)
end