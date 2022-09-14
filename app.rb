require 'date'
require 'fileutils'
require 'json'
require 'pry'
require './lib/book'
class App
  attr_reader :label
  def initialize
    FileUtils.mkdir_p('data')
    @books = File.exist?('data/book.json') ? JSON.parse(File.read('data/book.json'), create_additions: true) : []
    @label = File.exist?('data/label.json') ? JSON.parse(File.read('data/label.json'), create_additions: true) : []
  end

  def list_books
    if @books.empty?
      puts 'There are no books yet.'
    else
      @books.each do |book|
        puts "ID: #{book.id} - Publisher: \"#{book.publisher}\" - Cover State: #{book.cover_state} - published_date: #{book.publish_date}"
      end
    end
  end

def list_labels
    if @label.empty?
      puts 'There are no labels yet.'
    else
      @labels.each { |label| puts "ID: #{label.id} - Title: #{label.title} - Color: #{label.color} " }
    end
  end
  def use_string(prompt)
    print prompt
    gets.chomp.strip
  end

  def use_date(prompt)
    loop do
      date = Date.parse(use_string(prompt))
    rescue Date::Error
      puts 'Invalid date'
    else
      return date
    end
  end

  def choice_good_or_bad(prompt, valid_options)
    loop do
      input = use_string(prompt).upcase
      return input if valid_options.include?(input)
    end
  end

  def ask_publish_date
    use_date('Publish Date (YYYY-MM-DD): ')
  end

  def ask_publisher
    use_string('Publisher: ')
  end

  def ask_cover_state
    choice_good_or_bad('Cover_state (good/bad): ', %w[GOOD BAD]).downcase
  end

  def ask_book_info
    puts 'Please enter the book information'
    [
      ask_publish_date,
      ask_publisher,
      ask_cover_state
    ]
  end

  def add_book
    publish_date, publisher, cover_state = ask_book_info
    puts publish_date
    @books << Book.new(publish_date, publisher, cover_state)
    puts 'Book added successfully.'
  end

  def save_book_data
    File.write('data/books.json', JSON.generate(@books))
    File.write('data/labels.json', JSON.generate(@label))
  end
end