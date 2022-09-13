require 'Date'

class Item
  attr_reader :label

  def initialize(publish_date)
    @id = rand(1..1000)
    @genre = []
    @author = []
    @source = []
    @label = []
    @publish_date = Date.parse(publish_date)
    @archived = false
  end

  def can_be_archived?
    time = Time.new
    return true if time.year - @publish_date.year > 10

    false
  end

  def move_to_archive
    @archived = true if can_be_archived? == true
    false
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end
end

# testItem = Item.new('2010/10/20')
# p testItem.can_be_archived?
# p testItem.move_to_archive
