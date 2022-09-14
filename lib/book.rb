

require 'date'
require 'json'
require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state)
    super(genre, author, source, label, publish_date)
    @publisher = publisher
    @cover_state = cover_state

  
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [publish_date, publisher, cover_state, id]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['data'])
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end