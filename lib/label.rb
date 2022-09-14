class Label
  attr_reader :id, :items
  attr_accessor :color, :title

  def initialize(title, color, id = Random.rand(1..100))
    @id = id
    @color = color
    @title = title
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end
end