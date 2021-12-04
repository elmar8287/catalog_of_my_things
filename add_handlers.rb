require_relative 'item'
require_relative 'book'
require_relative 'music_album'
require_relative 'game'
require_relative 'label'
require_relative 'author'
require_relative 'genre'

module AddHandlers
  def add_book_menu
    book_details = prompt_book_details
    book = create_book(book_details)
    @catalog.add_book(book)
    add_item(book)
    puts "\nSUCCESS: Book added\n"
  end

  def add_music_album_menu
    music_album_details = prompt_music_album_details
    music_album = create_music_album(music_album_details)
    @catalog.add_music_album(music_album)
    add_item(music_album)
    puts "\nSUCCESS: Music Album added\n"
  end

  def add_game_menu
    game_details = prompt_game_details
    game = create_game(game_details)
    @catalog.add_game(game)
    add_item(game)
    puts "\nSUCCESS: Game added\n"
  end

  def add_item(item)
    add_genre(item)
    add_author(item)
    add_label(item)
  end

  def add_genre(item)
    option = prompt_option(
      "\nEnter existing genre number or enter N to add new genre",
      @catalog.genres
    )

    if option == 'N'
      genre_details = prompt_genre_details
      genre = create_genre(genre_details)
      @catalog.add_genre(genre)
    else
      genre = @catalog.genres[option.to_i]
    end
    item.genre = genre
  end

  def add_author(item)
    option = prompt_option(
      "\nEnter existing author number or enter N to add new author",
      @catalog.authors
    )

    if option == 'N'
      author_details = prompt_author_details
      author = create_author(author_details)
      @catalog.add_author(author)
    else
      author = @catalog.authors[option.to_i]
    end

    item.author = author
  end

  def add_label(item)
    option = prompt_option(
      "\nEnter existing label number or enter N to add new label",
      @catalog.labels
    )

    if option == 'N'
      label_details = prompt_label_details
      label = create_label(label_details)
      @catalog.add_label(label)
    else
      label = @catalog.labels[option.to_i]
    end

    item.label = label
  end
end
