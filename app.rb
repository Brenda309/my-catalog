require 'date'
require './lib/book'
class App
  attr_reader :label
  def initialize
    @books = []
    @label = []
  end

  def Add_books_list
    if @books.empty?
      puts 'There are no books yet.'
    else
      @books.each do |book|
        puts "Publisher: \"#{book.publisher}\" 
        puts "Cover State:\"#{book.cover_state}"
        puts "published_date: #{book.publish_date}"
      end
    end
  end

def list_labels
    if @label.empty?
      puts 'There are no labels yet.'
    else
      @label.each { |label| puts "ID: #{label.id} - Title: #{label.title} - Color: #{label.color} " }
    end
  end
  def use_string(prompt)
    puts prompt
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

  def get_publish_date
    use_date('Publish Date (YYYY-MM-DD): ')
  end

  def get_publisher
    use_string('Publisher: ')
  end

  def cover_state
    choice_good_or_bad('Cover_state (good/bad): ', %w[GOOD BAD]).downcase
  end

  def get_book_info
    puts 'Please enter the book information'
    [
      get_publish_date,
      get_publisher,
      cover_state
    ]
  end

  def add_book
    publish_date, publisher, cover_state = get_book_info
    puts publish_date
    @books << Book.new(publish_date, publisher, cover_state)
    puts 'Book added successfully.'
    puts ''
  end

  def save_book_data
    File.write('data/books.json', JSON.generate(@books))
    File.write('data/label.json', JSON.generate(@label))
  end
end