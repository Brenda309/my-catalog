require './lib/musicalbum'
require './lib/genre'
require 'json'

class App
  def initialize
    @music_albums = []
    @genres = []
  end

  def add_music_album
    actual_genres = []
    print 'Genre: '
    genre = gets.chomp
    print 'Author: '
    author = gets.chomp
    print 'Source: '
    source = gets.chomp
    print 'Label: '
    label = gets.chomp
    print 'Publish Date (DD-MM-YYYY): '
    publish_date = gets.chomp
    @music_albums << MusicAlbum.new(genre, author, source, label, publish_date)
    @genres.each { |gen| actual_genres.push(gen.name) }
    @genres << Genre.new(genre) unless actual_genres.index(genre)
    puts 'Music Album created successfully!'
    puts "\n"
  end

  def list_music_albums
    puts "\n"
    puts '       List of Music Albums'
    puts 'There is not music albums yet' if @music_albums.length.zero?
    @music_albums.each_with_index do |album, index|
      puts "
      #{index + 1}) Genre: #{album.genre}, Author: #{album.author}
      Source: #{album.source}, Label: #{album.label}
      Publish date: #{album.publish_date}, On Spotify: #{album.on_spotify}"
    end
    puts "\n"
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
    File.write('./data/albums.json', JSON.generate(albums_hash, opts))
  end

  def load_music_albums
    actual_genres = []
    unless File.zero?('./data/albums.json')
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
        @genres.each { |gen| actual_genres.push(gen.name) }
        @genres << Genre.new(album['genre']) unless actual_genres.index(album['genre'])
      end
      albums_file.close
    end
    @music_albums
  end
end
