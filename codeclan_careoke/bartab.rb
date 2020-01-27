class Bartab

  attr_reader :guests, :guests_money, :bill

  def initialize()
    @guests = []
    @guests_money = 0
    @bill = 0
  end

  def add_guest_to_tab(name)
    @guests.push(name)
    @guests_money += name.wallet
  end

  def add_to_bill(amount)
    @bill += (amount)
  end

  def pay_bill
    if @bill > @guests_money
      return "You must deposit more money to pay your bill"
    else
    @guests_money -= @bill
    @bill = 0
    end
  end

end
