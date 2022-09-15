require_relative 'app'

def list_of_options
  puts '╔════════════════════════════════════════════╗'
  puts '║                                            ║'
  puts '║    Welcome to the Catalog of my Things!    ║'
  puts '║                                            ║'
  puts '╚════════════════════════════════════════════╝'
  puts ''
  puts 'Please choose an option by entering a number:'
  puts ''
  puts '1 - List all books'
  puts '2 - List all music albums'
  puts '3 - List all games'
  puts '4 - List all labels'
  puts '5 - List all genres'
  puts '6 - List all authors'
  puts '7 - Add a book'
  puts '8 - Add a music album'
  puts '9 - Add a game'
  puts '0 - exit'
  print 'Please choose an option to proceed: '
end

# rubocop:disable Metrics/CyclomaticComplexity
def options(app, option)
  case option
  when 1 then app.books_list
  when 2 then app.list_music_albums
  when 3 then app.list_games
  when 4 then app.list_labels
  when 5 then app.list_genres
  when 6 then app.list_authors
  when 7 then app.add_books_list
  when 8 then app.add_music_album
  when 9 then app.add_game
  end
end
# rubocop:enable Metrics/CyclomaticComplexity

def exit_message
  puts 'thank you for using our app'
  puts 'created by Hans Zizold'
  puts 'created by Brenda Wihogora'
end

def load_data(app)
  app.load_list_books
  app.load_labels
  app.load_music_albums
  app.load_genres
  app.load_games
  app.load_authors
end

def save_data(app)
  app.save_book
  app.save_labels
  app.save_music_albums
  app.save_genres
  app.save_games
  app.save_authors
end

def main
  system('cls')
  app = App.new
  load_data(app)
  loop do
    list_of_options
    option = gets.to_i
    if !option.between?(0, 9)
      print 'Invalid option. Press Enter to retry... '
      gets.chomp
      next
    elsif option.zero?
      exit_message
      break
    else
      options(app, option)
    end
  end
  save_data(app)
end

main
