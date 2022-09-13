require './app'

def list_of_options
  puts '============================================'
  puts ''
  puts 'Please choose an option by entering a number:'
  puts ''
  puts '============================================='
  puts ''
  puts '1 - List all books'
  puts '2 - List all music albums'
  puts '3 - List all movies'
  puts '4 - List all genres'
  puts '5 - List all label'
  puts '6 - List all authors'
  puts '7 - List all sources'
  puts '8 - Add a book'
  puts '9 - Add a music album'
  puts '10 - Add a movie'
  puts '0 - exit'
  print 'Please choose an option to proceed: '
end

def exit_message
  puts 'thank you for using our app'
  puts 'created by Hans Zizold'
  puts 'created by Brenda Wihogora'
end

def main
  app = App.new
  loop do
    list_of_options
    option = gets.chomp.to_i
    if option > 10 && option < 0
      print 'Invalid option. Press Enter to retry... '
      gets.chomp
      system('clear')
      next
    elsif option.zero
      exit_message
      break
    else
      app.run(option)
    end
  end
end
main
