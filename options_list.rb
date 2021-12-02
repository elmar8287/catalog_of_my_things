module OptionsList
  def initialize
    @list_item_selection = 0
  end

  def selection_display
    puts "\nSelect an option\n"
    puts '----------------'
    puts '1. Books'
    puts '2. Music albums'
    puts '3. Games'
  end

  def selection_choice
    case @list_item_selection
    when 1
      puts "You have selected #{@books.length}#{@books.length > 1 ? ' books' : ' book'}"
      list_books
    when 2
      puts 'You have selected Music albums'
    when 3
      puts 'You have selected Games'
    else
      puts 'You have selected an invalid option'
    end
  end

  def list_items
    selection_display
    @list_item_selection = gets.chomp.to_i
    selection_choice
  end

  def list_books
    if @books.length.zero?
      puts 'There are no books in the library'
    else
      @books.each do |book|
        index = @books.index(book) + 1
        # rubocop:disable Layout/LineLength
        puts '⌜'
        puts " #{index}. This book is published by #{book.publisher} and is #{book.cover_state} and was published on #{book.publish_date}"
        puts '⌞'
        # rubocop:enable Layout/LineLength
      end
    end
  end

  def list_labels
    if @labels.length.zero?
      puts 'There are no labels'
    else
      @labels.each do |label|
        puts "There are #{label.id} labels"
        puts "Title: #{label.title}, Color: #{label.color}"
      end
    end
  end
end
