require_relative 'item'

class MusicAlbum < Item
  def initialize(genre, author, source, label, publish_date, on_spotify)
    super(genre, author, source, label, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return true if super && @on_spotify == true

    false
  end
end
