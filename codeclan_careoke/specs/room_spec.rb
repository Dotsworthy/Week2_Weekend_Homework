require('minitest/autorun')
require('minitest/reporters')
require_relative('../rooms')
require_relative('../songs')
require_relative('../guests')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestRooms < MiniTest::Test
  def setup
    @guest1 = Guest.new("George", 15.00, "American Pie")
    @guest2 = Guest.new("Paul", 15.00,"Like a Virgin")
    @guest3 = Guest.new("Ringo", 7.75, "Octopus Garden")
    @guest4 = Guest.new("John", 15.00, "Song 2")
    @song1 = Song.new("Like a Virgin")
    @song2 = Song.new("Hanging by the Telephone")
    @room1 = Room.new([@song1, @song2], 3, 15.00)
  end

  def test_get_room_songs
    assert_equal([@song1, @song2], @room1.songs)
  end

  def test_add_song
    @song3 = Song.new("Addicted_to_Love")
    @room1.add_song(@song3)
    assert_equal(3, @room1.count_of_songs)
  end

  def test_remove_song
    @room1.remove_song(@song2)
    assert_equal(1, @room1.count_of_songs)
  end

  def test_check_guest_in
    @room1.add_guest(@guest1)
    assert_equal(1, @room1.count_of_guests)
  end

  def test_check_guest_out
    @room2 = Room.new("Addicted_to_Love",3, 15.00)
    @room2.add_guest(@guest1)
    @room2.add_guest(@guest2)
    @room2.remove_guests()
    assert_equal(0, @room2.count_of_guests)
  end

  def test_get_room_size
    assert_equal(3,@room1.room_size)
  end

  def test_get_room_price
    assert_equal(15.00, @room1.price)
  end

  def test_cant_add_more_guests_than_room_size
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.add_guest(@guest3)
    @room1.add_guest(@guest4)
    assert_equal(3, @room1.count_of_guests)
  end

  def test_guest_pays_fee
    @room1.add_guest(@guest1)
    assert_equal(0.00, @guest1.wallet)
  end

  def test_guest_cannot_check_in_if_wallet_is_too_low
    @room1.add_guest(@guest3)
    assert_equal(0, @room1.count_of_guests)
  end

  def test_guest_does_not_lose_money_if_cant_check_in
    @room1.add_guest(@guest3)
    assert_equal(7.75, @guest3.wallet)
  end

  def test_play_song
    assert_equal("Playing Like a Virgin", @room1.play_song(@song1))
  end

  # def test_guests_favourite_song_is_playing
  # end
end
