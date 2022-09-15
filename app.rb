require 'date'
require './lib/book'
require './lib/label'
require 'json'
class App
  attr_reader :label

  def initialize
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
  end
end
