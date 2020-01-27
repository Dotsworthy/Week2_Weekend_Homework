class Guest

  attr_reader :guest_name, :wallet, :fav_song

  def initialize(guest_name, wallet, fav_song)
    @guest_name = guest_name
    @wallet = wallet
    @fav_song = fav_song
  end

  def remove_funds(amount)
    @wallet -= amount
  end

end
