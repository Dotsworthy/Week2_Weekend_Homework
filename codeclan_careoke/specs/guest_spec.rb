require('minitest/autorun')
require('minitest/reporters')
require_relative('../guests')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestGuests < MiniTest::Test

  def setup
    @guest1 = Guest.new("Andrew", 5.00, "Song 2")
  end

  def test_get_guest_name
    assert_equal("Andrew", @guest1.guest_name)
  end

  def test_get_wallet
    assert_equal(5.00, @guest1.wallet)
  end

  def test_remove_funds
    @guest1.remove_funds(3.00)
    assert_equal(2.00, @guest1.wallet)
  end

  def test_get_favourite_song
    assert_equal("Song 2", @guest1.fav_song)
  end
end
