require_relative 'music_album'
require_relative 'genre'
module Save_album
  def read_json_books
    books_json = File.read('./local/books.json')
    data_books = JSON.parse(books_json)
    data_books.each do |book|
      date = { day: book['publish_date']['day'], month: book['publish_date']['month'],
               year: book['publish_date']['year'] }
      add_book_input(date, book['publisher'], book['cover_state'])
    end
  end

  def read_json_labels
    labels_json = File.read('./local/labels.json')
    data_labels = JSON.parse(labels_json)
    data_labels.each { |label| create_label(label['title'], label['color']) }
  end

  def read_json_musicalbum
    file = './local/music_album.json'

    JSON.parse(File.read(file)).each do |album|
      date = { day: album['publish_date']['day'], month: album['publish_date']['month'],
               year: album['publish_date']['year'] }
      @albums << MusicAlbum.new(album['name'], date, album['on_spotify'])
    end
  end
  