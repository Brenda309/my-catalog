class Label
  attr_accessor :title, :color
  attr_reader :items

  def initialize
    @id = rand(1..1000)
    @title = ''
    @color = ''
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end
end
