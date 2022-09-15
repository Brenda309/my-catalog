require 'date'
require './lib/book'
require './lib/label'
require './lib/musicalbum'
require './lib/genre'
require './lib/game'
require './lib/author'
require 'json'

# rubocop:disable Metrics/ClassLength:
class App
  attr_reader :label
     
  def initialize
    @music_albums = []
    @genres = []
    @games = []
    @authors = []
    @books = []
    @label = []
  end

  def add_books_list
    puts 'Genre: '
    genre = gets.chomp
    puts 'Author first name: '
    author_first_name = gets.chomp
    puts 'Author last name: '
    author_last_name = gets.chomp
    author = "#{author_first_name} #{author_last_name}"
    puts 'Source (NA if it does not apply): '
    source = gets.chomp
    puts 'Label (NA if it does not apply): '
    label = gets.chomp
    puts 'Publish Date (DD-MM-YYYY): '
    publish_date = gets.chomp
    puts 'Publisher:'
    publisher = gets.chomp
    puts 'cover state(good/bad)'
    cover_state = gets.chomp
    puts 'Book_title'
    label_title = gets.chomp
    puts 'label_color'
    label_color = gets.chomp
    @books << Book.new(genre, author, source, label, publish_date, publisher, cover_state)
    update(label_title, label_color)

  def add_music_album
    print 'Genre: '
    genre = gets.chomp
    print 'Author first name: '
    author_first_name = gets.chomp
    print 'Author last name: '
    author_last_name = gets.chomp
    author = "#{author_first_name} #{author_last_name}"
    print 'Source (NA if it does not apply): '
    source = gets.chomp
    print 'Label (NA if it does not apply): '
    label = gets.chomp
    print 'Publish Date (YYYY-MM-DD): '
    publish_date = gets.chomp
    @music_albums << MusicAlbum.new(genre, author, source, label, publish_date)
    update(genre, author_first_name, author_last_name)
    puts 'Music Album created successfully!'
    puts "\n"
  end

  def books_list
    puts "\n"
    puts '       List of books'
    puts 'There is not list of books yet' if @books.length.zero?
    @books.each_with_index do |list, index|
      puts "
      #{index + 1}) Genre: #{list.genre}, Author: #{list.author}
      Source: #{list.source}, Label: #{list.label}
      Publish date: #{list.publish_date}, Publisher: #{list.publisher}, cover-state: #{list.cover_state},"
    end
    puts "\n"
  end

  def list_labels
    puts "\n"
    puts '      List of Label'
    puts "\n"
    puts 'There is not labels' if @label.length.zero?
    @label.each_with_index do |label, index|
      puts "      #{index + 1}) #{label.title} #{label.color}"
    end
    puts "\n"
  end

  def update(label_title, label_color)
    actual_label = []
    label = "#{label_title}#{label_color}"
    @label.each { |lab| actual_label.push(lab.name) }
    @label << Label.new(label_title, label_color) unless actual_label.index(label)
  end

  def save_book
    books_hash = []
    @books.each do |list|
      books_hash.push({ genre: list.genre,
                        author: list.author,
                        source: list.source,
                        label: list.label,
                        publish_date: list.publish_date,
                        publisher: list.publisher,
                        cover_state: list.cover_state })
    end
    File.new('./data/books.json', 'w') unless File.exist?('./data/books.json')
  def add_game
    print 'Genre: '
    genre = gets.chomp
    print 'Author first name: '
    author_first_name = gets.chomp
    print 'Author last name: '
    author_last_name = gets.chomp
    author = "#{author_first_name} #{author_last_name}"
    print 'Source (NA if it does not apply): '
    source = gets.chomp
    print 'Label (NA if it does not apply): '
    label = gets.chomp
    print 'Publish Date (YYYY-MM-DD): '
    publish_date = gets.chomp
    print 'Last Played at (YYYY-MM-DD): '
    last_played_at = gets.chomp
    @games << Game.new(genre, author, source, label, publish_date, last_played_at)
    update(genre, author_first_name, author_last_name)
    puts 'Game created successfully!'
    puts "\n"
  end

  def list_music_albums
    puts "\n"
    puts '      List of Music Albums'
    puts '      There is not music albums yet' if @music_albums.length.zero?
    @music_albums.each_with_index do |album, index|
      puts "
      #{index + 1}) Genre: #{album.genre}, Author: #{album.author}
      Source: #{album.source}, Label: #{album.label}
      Publish date: #{album.publish_date}, On Spotify: #{album.on_spotify}"
    end
    puts "\n"
    p 'Press Enter to continue'
    gets
  end

  def list_games
    puts "\n"
    puts '      List of Games'
    puts 'There is not games yet' if @games.length.zero?
    @games.each_with_index do |game, index|
      puts "
      #{index + 1}) Genre: #{game.genre}, Author: #{game.author}, Source: #{game.source}
      Label: #{game.label}, Publish date: #{game.publish_date}
      Multiplayer: #{game.multiplayer}, Last played at: #{game.last_played_at}"
    end
    puts "\n"
    p 'Press Enter to continue'
    gets
  end

  def list_genres
    puts "\n"
    puts '      List of Genres'
    puts "\n"
    puts 'There is not Genres' if @genres.length.zero?
    @genres.each_with_index do |genre, index|
      puts "      #{index + 1}) #{genre.name}"
    end
    puts "\n"
    p 'Press Enter to continue'
    gets
  end

  def list_authors
    puts "\n"
    puts '      List of Authors'
    puts "\n"
    puts 'There is not Authors' if @authors.length.zero?
    @authors.each_with_index do |author, index|
      puts "      #{index + 1}) #{author.first_name} #{author.last_name}"
    end
    puts "\n"
    p 'Press Enter to continue'

    gets
  end

  def save_music_albums
    albums_hash = []
    @music_albums.each do |album|
      albums_hash.push({ genre: album.genre,
                         author: album.author,
                         source: album.source,
                         label: album.label,
                         publish_date: album.publish_date,
                         on_spotify: album.on_spotify })
    end
    File.new('./data/albums.json', 'w') unless File.exist?('./data/albums.json')
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    File.write('./data/books.json', JSON.generate(books_hash, opts))
  end

  def save_labels
    labels_hash = []
    @label.each do |lab|
      labels_hash.push({ label_title: lab.title,
                         label_color: lab.color })
    end
    File.new('./data/label.json', 'w') unless File.exist?('./data/label.json')
    File.write('./data/albums.json', JSON.generate(albums_hash, opts))
  end

  def save_games
    games_hash = []
    @games.each do |game|
      games_hash.push({ genre: game.genre,
                        author: game.author,
                        source: game.source,
                        label: game.label,
                        publish_date: game.publish_date,
                        last_played_at: game.last_played_at,
                        multiplayer: game.multiplayer })
    end
    File.new('./data/games.json', 'w') unless File.exist?('./data/games.json')
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    File.write('./data/label.json', JSON.generate(labels_hash, opts))
  end

  def load_list_books
    if File.exist?('./data/books.json')
      books_file = File.open('./data/books.json')
      books_hash = JSON.parse(books_file.read)
    end
    unless books_hash.empty?
      books_hash.each do |list|
        @books << Book.new(
          list['genre'],
          list['author'],
          list['source'],
          list['label'],
          list['publish_date'],
          list['publisher'],
          list['cover_state']
        )
      end
      books_file.close
    end
    @books
  end

  def load_labels
    if File.exist?('./data/label.json')
      label_file = File.open('./data/label.json')
      labels_hash = JSON.parse(label_file.read)
    end
    unless labels_hash.empty?
      labels_hash.each do |lab|
        @label << Label.new(
          lab['label_title'],
          lab['label_color']
        )
      end
      label_file.close
    end
    @label
    File.write('./data/games.json', JSON.generate(games_hash, opts))
  end

  def save_genres
    genres_hash = []
    @genres.each do |genre|
      genres_hash.push({ name: genre.name })
    end
    File.new('./data/genres.json', 'w') unless File.exist?('./data/genres.json')
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    File.write('./data/genres.json', JSON.generate(genres_hash, opts))
  end

  def save_authors
    authors_hash = []
    @authors.each do |author|
      authors_hash.push({ first_name: author.first_name, last_name: author.last_name })
    end
    File.new('./data/authors.json', 'w') unless File.exist?('./data/authors.json')
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    File.write('./data/authors.json', JSON.generate(authors_hash, opts))
  end

  def load_music_albums
    albums_hash = []
    if File.exist?('./data/albums.json')
      albums_file = File.open('./data/albums.json')
      albums_hash = JSON.parse(albums_file.read)
    end
    unless albums_hash.empty?
      albums_hash.each do |album|
        @music_albums << MusicAlbum.new(
          album['genre'],
          album['author'],
          album['source'],
          album['label'],
          album['publish_date'],
          on_spotify: album['on_spotify']
        )
      end
      albums_file.close
    end
    @music_albums
  end

  def load_games
    games_hash = []
    if File.exist?('./data/games.json')
      games_file = File.open('./data/games.json')
      games_hash = JSON.parse(games_file.read)
    end
    unless games_hash.empty?
      games_hash.each do |game|
        @games << Game.new(
          game['genre'],
          game['author'],
          game['source'],
          game['label'],
          game['publish_date'],
          game['last_played_at'],
          multiplayer: game['multiplayer']
        )
      end
      games_file.close
    end
    @games
  end

  def load_genres
    genres_hash = []
    if File.exist?('./data/genres.json')
      genres_file = File.open('./data/genres.json')
      genres_hash = JSON.parse(genres_file.read)
    end
    unless genres_hash.empty?
      genres_hash.each do |genre|
        @genres << Genre.new(genre['name'])
      end
      genres_file.close
    end
    @genres
  end

  def load_authors
    authors_hash = []
    if File.exist?('./data/authors.json')
      authors_file = File.open('./data/authors.json')
      authors_hash = JSON.parse(authors_file.read)
    end
    unless authors_hash.empty?
      authors_hash.each do |author|
        @authors << Author.new(author['first_name'], author['last_name'])
      end
      authors_file.close
    end
    @authors
  end

  private

  def update(genre, author_first_name, author_last_name)
    actual_authors = []
    actual_genres = []
    author = "#{author_first_name} #{author_last_name}"
    @authors.each { |aut| actual_authors.push("#{aut.first_name} #{aut.last_name}") }
    @authors << Author.new(author_first_name, author_last_name) unless actual_authors.index(author)
    @genres.each { |gen| actual_genres.push(gen.name) }
    @genres << Genre.new(genre) unless actual_genres.index(genre)
  end
end
# rubocop:enable Metrics/ClassLength:
