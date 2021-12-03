require_relative 'music_album'
require_relative 'genre'
module Storage
  def read_json_books
    books_json = File.read('./local/books.json')
    data_books = JSON.parse(books_json)
    data_books.each do |book|
      date = { day: book['publish_date']['day'], month: book['publish_date']['month'],
               year: book['publish_date']['year'] }
      add_book_input(date, book['publisher'], book['cover_state'])
    end
  end
