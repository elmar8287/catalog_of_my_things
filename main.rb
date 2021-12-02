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
