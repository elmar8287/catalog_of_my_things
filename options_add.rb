require './book'
require './label'

module AddOptions
  def initialize
    @add_item_option = 0
  end

  def add_item_options
    puts "\nWhat would you like to add?\n"
    puts '--------------------------'
    puts '1. Add Book'
    puts '2. Add Music album'
    puts '3. Add Game'
  end

  def add_item_select
    case @add_item_option
    when 1
      add_book
    when 2
      add_music_album
    when 3
      add_game
    else
      'Invalid option'
    end
  end

  def add_item
    add_item_options
    @add_item_option = gets.chomp.to_i
    add_item_select
  end

  def add_book
    puts 'Enter the book\'s publisher:'
    publisher = gets.chomp
    puts 'Enter the book\'s cover state:'
    cover_state = gets.chomp
    puts 'Enter the book\'s published date:'
    published_date = enter_date
    book = Book.new(publisher, cover_state, published_date)
    @books << book
    puts 'Book added!'
  end

  def enter_date
    puts 'Enter the year: '
    year = gets.chomp.to_i
    puts 'Enter the month:'
    month = gets.chomp.to_i
    puts 'Enter the day:'
    day = gets.chomp.to_i
    begin
      date = Date.new(year, month, day)
    rescue StandardError
      puts 'Invalid date'
      enter_date
    else
      date
    end
  end
end
