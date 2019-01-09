
def book_attributes(txt)
    title = ""
    author = ""
    release_date = ""
    language = ""
    text = ""
    sample_text = ""
    searchable_text = []

    #params of open may need to be different depending on source of txt files

    File.open(txt).each.each_with_index do |line, index|
      text += line

      if line.match(/^Title: /)
        title = line.gsub(/Title: /, "").gsub(/\r\n/,'').titleize
      end

      if line.match(/^Author: /)
        author = line.gsub(/Author: /, "").gsub(/\r\n/,'')
      end

      if line.match(/^Release Date: /)
        release_date = line.gsub(/Release Date: /, "").gsub(/\WEBook #\d{1,}\W/, "").gsub(/\n/, "")
      end

      if line.match(/^Language: /)
        language = line.gsub(/Language: /, "").gsub(/\r\n/,'')
      end

      line.split.each do |word|
        #gets a string containing first 1000-ish words
        if sample_text.split(" ").length < 1000
          sample_text+=word+=" "
        end

        if line.match(/^Produced /) && sample_text.split(" ").length < 1000
          sample_text = ""
        end

        #gets all text minus non-word/number characters, useful for searching
        searchable_text << word.gsub(/[^a-zA-Z\d]/, '')
      end
    end
    
    #this ensures all sample text starts in the right place
    if sample_text.include?(title)
      sample_text = title + sample_text.split(title)[1]
    elsif sample_text.include?(title.upcase)
      sample_text = title.upcase + sample_text.split(title.upcase)[1]
    elsif sample_text.include?(title.downcase)
      sample_text = title.downcase + sample_text.split(title.downcase)[1]
    end

    return {title: title, author: author, release_date: release_date, language: language, text: text, searchable_text: searchable_text, sample_text: sample_text}
end

txt = {"EurekaAProsePoem.txt" => "NoCover.jpg", "TheFallOfTheHouseOfUsher.txt" => "NoCover.jpg", "TheRaven.txt" => "TheRaven.jpg", "TheMasqueOfTheRedDeath.txt" => "NoCover.jpg", "TheCaskOfAmontillado.txt" => "NoCover.jpg"}

txt.each do |txt, img|
  book_hash = book_attributes(txt)
  book = Book.create(book_hash)
  book.cover_art.attach(io: File.open(img), filename: img.to_s, content_type: "image/jpg")
end