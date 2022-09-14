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
    @items << item unless @items.include?(item)
    item.label = self unless item.class != String
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [title, color, id]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['data'])
  end
end