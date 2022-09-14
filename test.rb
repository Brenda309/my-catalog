require './lib/item'
require './lib/genre'
require './lib/author'
require './lib/musicalbum'
require './lib/game'

# system('cls')
# item1 = Item.new('Rock', 'Bon Jovi', 'Deezer', 'Sony', '2005-12-25')
# p item1.can_be_archived?

# item2 = Item.new('Pop', 'Madonna', 'Spotify', 'EMI', '20-10-2010')
# p item2.can_be_archived?
# p item1.genre
# p item2.author

# genre1 = Genre.new('Rock')
# p genre1.name

# p item1.genre
# genre1.add_item(item1)
# genre1.add_item(item2)
# p item1.genre.name
# genre1.items.each { |item| p item.publish_date }
# p genre1.items.count

# item3 = Item.new('Soul', 'Aretha Franklin', 'Youtube', 'Sony', '18-05-2019')
# p item3.genre
# item3.genre = genre1
# p item3.genre.name
# p genre1.items.count
# p genre1.items.last.publish_date

# album1 = MusicAlbum.new('Alternative', 'Beck', 'Youtube', 'EMI', '18-05-2018')
# p album1.genre
# p album1.on_spotify
# genre2 = Genre.new('Alternative')
# p genre2.items.count
# genre2.add_item(album1)
# p genre2.items.count

# print 'Author first name: '
# author_first_name = gets.chomp
# print 'Author last name: '
# author_last_name = gets.chomp
# author = "#{author_first_name} #{author_last_name}"
game1 = Game.new('Arcade', 'John Doe', 'Nintendo', 'NA', '2005-05-18', '2012-09-10')
p game1.publish_date
p game1.last_played_at
p game1.can_be_archived?


# p game1.genre
# p game1.author
# p game1.source
# p game1.label

# author1 = Author.new('John', 'Doe')
# p author1.first_name
# p author1.last_name
