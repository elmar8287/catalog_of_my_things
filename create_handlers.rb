require_relative 'book'
require_relative 'music_album'
require_relative 'game'
require_relative 'genre'
require_relative 'author'
require_relative 'label'

module CreateHandlers
  def create_book(book_details)
    Book.new(*book_details)
  end

  def create_music_album(music_album_details)
    MusicAlbum.new(*music_album_details)
  end

  def create_game(game_details)
    Game.new(*game_details)
  end

  def create_genre(genre_details)
    Genre.new(*genre_details)
  end

  def create_author(author_details)
    Author.new(*author_details)
  end

  def create_label(label_details)
    Label.new(*label_details)
  end
end
