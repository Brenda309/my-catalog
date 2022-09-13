class App
  attr_reader :label

  def run(option)
    case option
    when 1 then list_books
    when 2 then list_music_albums
    when 3 then list_movies
    when 4 then list_genres
    when 5 then list_labels
    when 6 then list_authors
    when 7 then add_book
    when 8 then add_music_album
    when 9 then add_game
    else puts 'invalid option'
    end
  end
end
