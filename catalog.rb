require_relative 'item'
require_relative 'book'
require_relative 'game'
require_relative 'label'
require_relative 'author'
require 'json'

class Catalog
  attr_reader :books, :music_albums, :games, :genres, :authors, :labels

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = []
    @authors = []
    @labels = []
  end

  def add_book(book)
    @books.push(book)
  end

  def add_game(game)
    @games.push(game)
  end

  def add_music_album(music_album)
    @music_albums.push(music_album)
  end

  def add_genre(genre)
    @genres.push(genre)
  end

  def add_author(author)
    @authors.push(author)
  end

  def add_label(label)
    @labels.push(label)
  end

  def list_books
    @books.each { |book| puts book }
  end

  def list_games
    @games.each { |game| puts game }
  end

  def list_music_album
    @music_albums.each { |ms_album| puts ms_album }
  end

  def list_genres
    @genres.each { |genre| puts genre }
  end

  def list_authors
    @authors.each { |author| puts author }
  end

  def list_labels
    @labels.each { |label| puts label }
  end

  def load_data
    @books = load_file('books.json')

    @genres = load_file('genres.json')
    @labels = load_file('labels.json')

    load_relationships(@books, 'books.json')
  end

  def load_file(file)
    if File.exist?(file)
      JSON.parse(File.read(file), create_additions: true)
    else
      []
    end
  end

  def load_relationships(games, sources)
    return unless File.exist?('games.json')

    games_json = JSON.parse(File.read('games.json'))
    games_json.each_with_index do |game_json, index|
      source = sources.detect { |source_json| source_json.id == game_json['source_id'] }
      game = games[index]
      game.source = source
    end
  end

  def save_data
    save_file(@genres, 'genres.json')
    save_file(@authors, 'authors.json')
    save_file(@labels, 'labels.json')
    save_file(@books, 'books.json')
    save_file(@music_albums, 'music_albums.json')
    save_file(@games, 'games.json')
  end

  def save_files
    File.write('games.json', JSON.generate(@games)) if @games.any?
    File.write('sources.json', JSON.generate(@sources)) if @sources.any?
  end
end
