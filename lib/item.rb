require 'Date'

class Item
  attr_reader :genre

  attr_accessor :author, :source, :label, :publish_date

  def initialize(genre, author, source, label, publish_date)
    @id = rand(1..1000)

    @genre = genre

    @author = author

    @source = source

    @label = label

    @publish_date = Date.parse(publish_date)

    @archived = false
  end

  def move_to_archive
    @archived = true if can_be_archived? == true

    false
  end

  def genre=(genre)
    @genre = genre

    genre.items.push(self) unless genre.items.include?(self)
  end

  def can_be_archived?
    time = Time.new

    return true if time.year - @publish_date.year > 10

    false
  end
end
