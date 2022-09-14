class Item
  attr_reader :genre, :author
  attr_accessor :source, :label, :publish_date

  def initialize(genre, author, source, label, publish_date)
    @id = rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.add_item(self) unless author.items.include?(self)
  end

  def can_be_archived?
    (Date.today << 120 <=> @publish_date).positive?
  end

  def move_to_archive
    @archived = true if can_be_archived? == true

    false
  end
end