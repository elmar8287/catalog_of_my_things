require_relative 'catalog'

class Main
  def initialize
    @catalog = Catalog.new
    @choice = 0
  end

  def run_app
    puts 'Welcome to the catalog!'
    sleep 0.75
  end

  def show_options
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all games'
    puts '4 - List all labels'
    puts '5 - List all genres'
    puts '6 - List all authors'
    puts '7 - Add a book'
    puts '8 - Add a music album'
    puts '9 - Add a game'
    puts '10 - Exit'
  end

  # rubocop:disable Metrics
  def select_option(_user_choice)
    case @choice
    when 1
      @catalog.list_books
    when 2
      @catalog.list_music_album
    when 3
      @catalog.list_games
    when 4
      @catalog.list_labels
    when 5
      @catalog.list_genres
    when 6
      @catalog.list_authors
    when 7
      add_book_menu
    when 8
      add_music_album_menu
    when 9
      add_game_menu
    else
      puts 'Invalid input, please try again'
      show_options
    end
  end
end

# rubocop:enable Metrics

Main.new.run_app
