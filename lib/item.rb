class Item
  def initialize(publish_date)
    @id = rand(1..1000)
    @genre = []
    @author = []
    @source = []
    @label = []
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    time = Time.new
    publish_year = @publish_date[6..]
    return true if time.year - publish_year.to_i > 10

    false
  end

  def move_to_archive
    @archived = true if can_be_archived? == true
    false
  end
end

# testItem = Item.new('20-10-2013')
# p testItem.can_be_archived?
# p testItem.move_to_archive
