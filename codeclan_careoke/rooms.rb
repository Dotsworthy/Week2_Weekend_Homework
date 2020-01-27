class Room

  attr_reader :songs, :room_size, :price

  def initialize(songs, room_size, price)
    @songs = songs
    @guests = []
    @room_size = room_size
    @price = price
  end

  def add_song(song)
    @songs.push(song)
  end

  def remove_song(song)
    @songs.delete(song)
  end

  def count_of_songs
    @songs.length
  end

  def add_guest(guest)
    if @guests.length == @room_size
      return "Sorry, this room is full"
    elsif guest.wallet < @price
      return "Sorry, you do not have enough funds"
    else
    @guests.push(guest)
    guest.remove_funds(@price)
    end
  end

  def remove_guests()
    @guests.clear()
  end

  def count_of_guests
    @guests.length
  end

  def play_song(song)
    song_found = @songs.find {|song| @songs.song_name == song }
    return "Playing #{song_found}"
  end
end
