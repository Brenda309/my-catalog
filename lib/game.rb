require_relative 'item'
require 'Date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(*args, last_played_at, multiplayer: true)
    super(*args)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    return true if super && Time.new.year - @last_played_at.year > 2

    false
  end
end
