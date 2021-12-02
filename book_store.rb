require './book'
require 'json'

module StoreBooks
  def parse_books
    File.open('books.json', 'w') { |f| f.write JSON.generate([]) } unless File.exist? 'books.json'

    JSON.parse(File.read('books.json')).map do |book|
      @books << Book.new(book['publisher'], book['cover_state'], book['publish_date'])
    end
  end

  def save_books
    @saved_data = []
    @books.each do |book|
      @saved_data.push({ 'publisher' => book.publisher, 'cover_state' => book.cover_state,
                         'publish_date' => book.publish_date })
    end
    File.write('books.json', JSON.generate(@saved_data))
  end
end
