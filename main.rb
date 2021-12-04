require_relative 'add_handlers'
require_relative 'prompt_handlers'
require_relative 'create_handlers'
require_relative 'catalog'

class Main
  include AddHandlers
  include PromptHandlers
  include CreateHandlers

  def initialize
    @catalog = Catalog.new
  end

  def start_app
    puts "Welcome to the catalog!\n"

    @catalog.load_data

    loop do
      show_menu
      choice = prompt_choice
      break if choice == 10

      handle_choice(choice)
    end

    @catalog.save_data
    puts "\nThank you for using the catalog!\n"
  end

  def show_menu
    puts 'Please choose an option by entering a number:'
    puts [
      '1 - List all books',
      '2 - List all music albums',
      '3 - List all games',
      '4 - List all labels',
      '5 - List all genres',
      '6 - List all authors',
      '7 - Add a book',
      '8 - Add a music album',
      '9 - Add a game',
      '10 - Exit'
    ]
  end

  def prompt_choice
    print "\nPlease choose an option by entering a number from 1 to 10: "
    gets.chomp.to_i
  end

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/CyclomaticComplexity
  def handle_choice(choice)
    case choice
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
      puts "\nERROR: Invalid option. See available options below.\n"
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength
end

Main.new.start_app
