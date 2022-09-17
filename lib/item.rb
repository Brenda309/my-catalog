class Item
  attr_reader :genre, :author, :label
  attr_accessor :source, :publish_date, :archived

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

  def label=(label)
    @label = label
    label.add_item(self) unless label.items.include?(self)
  end

  def can_be_archived?
    return true if Time.now.year - @publish_date[0..3].to_i > 10

    false
  end

  def move_to_archive
    @archived = true if can_be_archived? == true

    @archived
  end
end
