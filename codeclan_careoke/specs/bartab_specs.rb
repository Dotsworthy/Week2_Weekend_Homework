require('minitest/autorun')
require('minitest/reporters')
require_relative('../bartab')
require_relative('../guests')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestBartab < MiniTest::Test
  def setup
    @bartab1 = Bartab.new()
    @guest1 = Guest.new("Jeremy", 8.00, "Song 2")
    @guest2 = Guest.new("Boris", 7.00, "I Shot The Sheriff")
  end

    def test_add_guest_to_bar_tab
      @bartab1.add_guest_to_tab(@guest1)
      assert_equal([@guest1], @bartab1.guests)
    end

    def test_get_guests_money
      @bartab1.add_guest_to_tab(@guest1)
      @bartab1.add_guest_to_tab(@guest2)
      assert_equal(15.00, @bartab1.guests_money)
    end

    def test_add_to_bill
      @bartab1.add_to_bill(5.00)
      assert_equal(5.00, @bartab1.bill)
    end

    def test_pay_bill
      @bartab1.add_guest_to_tab(@guest1)
      @bartab1.add_guest_to_tab(@guest2)
      @bartab1.add_to_bill(14.00)
      @bartab1.pay_bill
      assert_equal(0, @bartab1.bill)
      assert_equal(1, @bartab1.guests_money)
    end

    def test_guests_need_enough_money
      @bartab1.add_guest_to_tab(@guest1)
      @bartab1.add_guest_to_tab(@guest2)
      @bartab1.add_to_bill(20.00)
      @bartab1.pay_bill
      assert_equal(20, @bartab1.bill)
      assert_equal(15, @bartab1.guests_money)
    end
end
