require './lib/item'
require './lib/genre'
require './lib/musicalbum'

system('cls')
item1 = Item.new('Rock', 'Bon Jovi', 'Deezer', 'Sony', '2015/12/25')
item2 = Item.new('Pop', 'Madonna', 'Spotify', 'EMI', '20-10-2010')
p item1.can_be_archived?
p item2.can_be_archived?
p item1.genre
p item2.author

genre1 = Genre.new('Rock')
p genre1.name

p item1.genre
genre1.add_item(item1)
genre1.add_item(item2)
p item1.genre.name
genre1.items.each { |item| p item.publish_date }
p genre1.items.count

item3 = Item.new('Soul', 'Aretha Franklin', 'Youtube', 'Sony', '18-05-2019')
p item3.genre
item3.genre = genre1
p item3.genre.name
p genre1.items.count
p genre1.items.last.publish_date

album1 = MusicAlbum.new('Alternative', 'Beck', 'Youtube', 'EMI', '18-05-2018', true)
p album1.can_be_archived?
p album1.genre
genre2 = Genre.new('Alternative')
p genre2.name
p genre2.items.count
genre2.add_item(album1)
p genre2.items.count
