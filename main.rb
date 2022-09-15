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
  puts '3 - List all movies'
  puts '4 - List all genres'
  puts '5 - List all label'
  puts '6 - List all authors'
  puts '7 - List all sources'
  puts '8 - Add a book'
  puts '9 - Add a Music Album'
  puts '10 - Add a movie'
  puts '11 - exit'
  print 'Please choose an option to proceed: '
end

# rubocop:disable Metrics/CyclomaticComplexity
def options(app, option)
  case option
  when 1 then app.books_list
  when 2 then app.list_music_albums
  when 3 then list_movies
  when 4 then app.list_genres
  when 5 then app.list_labels
  when 6 then list_authors
  when 7 then list_sources
  when 8 then app.add_books_list
  when 9 then app.add_music_album
  when 10 then add_movie
  end
end
# rubocop:enable Metrics/CyclomaticComplexity

def exit_message
  puts 'thank you for using our app'
  puts 'created by Hans Zizold'
  puts 'created by Brenda Wihogora'
end

def main
  system('cls')
  app = App.new
  app.load_list_books
  app.load_labels
  loop do
    list_of_options
    option = gets.to_i
    if option > 11 || option < 1
      print 'Invalid option. Press Enter to retry... '
      gets.chomp
      next
    elsif option == 11
      exit_message
      break
    else
      options(app, option)
    end
  end
  app.save_book
  app.save_labels
end

main
