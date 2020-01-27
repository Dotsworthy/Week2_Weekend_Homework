require('minitest/autorun')
require('minitest/reporters')
require_relative('../songs')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestSongs < MiniTest::Test
  def setup
    @song1 = Song.new("Born to Run")
  end

  def test_get_song_name
    assert_equal("Born to Run", @song1.song_name)
  end

end
