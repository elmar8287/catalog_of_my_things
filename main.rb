class Main
  def initialize
    @choice = 0
    @books = []
    @music_albums = []
    @games = []
    @genres = []
    @authors = []
    @labels = []
  end

  def run_app
    put 'Welcome to the catalog!'
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
      list_books
    when 2
      list_music_album
    when 3
      list_games
    when 4
      list_labels
    when 5
      list_genres
    when 6
      list_authors
    when 7
      add_book_menu
    when 8
      add_music_album_menu
    when 9
      add_game_menu
    else
      if @choice != 7
        puts 'Invalid input, please try again'
        puts
      end
    end
  end
end

# rubocop:enable Metrics

Main.new.run_app
=======
require './options_add'
require './options_list'
require './book'
require './book_store'
require 'json'

class App
  include OptionsList
  include AddOptions
  include StoreBooks

  def initialize
    @books = []
    @labels = [Label.new('New', 'yellow'), Label.new('Used', 'green'), Label.new('Old', 'red')]
    @option = 0
    parse_books
  end

  def select_option
    case @option
    when 1
      list_items
    when 2
      list_genres
    when 3
      list_labels
    when 4
      list_authors
    when 5
      add_item
    when 6
      exit_app
    else
      puts 'Invalid option'
    end
  end

  def main
    loop do
      puts "\nSelect an option\n"
      puts '-------------'
      puts '1. List items'
      puts '2. List genres'
      puts '3. List labels'
      puts '4. List authors'
      puts '5. Add item'
      puts '6. Exit'
      @option = gets.chomp.to_i
      select_option
    end
  end

  def exit_app
    puts 'Do you really want to save data? (y/n)'
    save = gets.chomp.downcase == 'y'
    save_books if save
    puts 'Thanks for using my app Catalog of my Things :)'
    exit
  end
end

puts 'Welcome to my Catalog of my Things'

App.new.main

