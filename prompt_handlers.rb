module PromptHandlers
  def prompt_option(text, options)
    puts "\n***SELECT***\n\n"

    options&.each_with_index { |option, index| puts "#{index} - #{option}\n" }

    prompt(text)
  end

  def prompt_book_details
    puts "\n***ENTER BOOK DETAILS***\n\n"

    publish_date = prompt('Publish date')
    publisher = prompt('Publisher')
    cover_state = prompt('Cover state')

    [publish_date, publisher, cover_state]
  end

  def prompt_music_album_details
    puts "\n***ENTER MUSIC ALBUM DETAILS***\n\n"

    publish_date = prompt('Publish date')
    on_spotify = prompt('Album on Spotify [Y/N]')

    [publish_date, on_spotify]
  end

  def prompt_game_details
    puts "\n***ENTER GAME DETAILS***\n\n"

    publish_date = prompt('Publish date')
    multiplayer = prompt('Multiplayer')
    last_played_at = prompt('Last played at')

    [publish_date, multiplayer, last_played_at]
  end

  def prompt_genre_details
    puts "\n***ENTER GENRE DETAILS***\n\n"

    prompt('Name')
  end

  def prompt_author_details
    puts "\n***ENTER AUTHOR DETAILS***\n\n"

    first_name = prompt('First name')
    second_name = prompt('Second name')

    [first_name, second_name]
  end

  def prompt_label_details
    puts "\n***ENTER LABEL DETAILS***\n\n"

    title = prompt('Title')
    color = prompt('color')

    [title, color]
  end

  def prompt(data_item)
    print "#{data_item}: "

    gets.chomp
  end
end
