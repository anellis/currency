require 'minitest/autorun'
require 'minitest/pride'
require './currency'

class CurrencyTest <Minitest::Test
  def test_currency_class_exists
    assert Currency
  end

  def test_currency_has_amount_and_code
    dollar= Currency.new(1, "USD")
  end

  def test_two_currencies_with_same_amount_and_code_are_equal
    dollar= Currency.new(1, "USD")
    another_dollar= Currency.new(1, "USD")
    assert dollar == (another_dollar)
  end

  # def test_two_currencies_with_different_amount_are_not_equal
  #   dollar= Currency.new(1, "USD")
  #   yen=Currency.new(1,"JPY")
  #   assert !dollar.equal(yen)
  # end

  def test_two_curriences_can_be_added
    poor= Currency.new(1, "USD")
    rich= Currency.new(100, "USD")
    assert_equal 101, poor + (rich)
  end

  def test_two_curriences_can_be_subtracted
    rich= Currency.new(150, "USD")
    middle_class= Currency.new(50, "USD")
    assert_equal 100, rich - (middle_class)
  end

  def test_currency_code_error
    rich= Currency.new(150, "USD")
    middle_class= Currency.new(50, "ARS")
    begin
      rich + middle_class
    rescue Exception => ex
      assert_equal DifferentCurrencyCodeError, ex.class
    end
  end

  def test_can_be_multiplied_by_fixnum_or_float
    unnecessarily_wealthy= Currency.new(500, "ARS")
    assert_equal 5000, unnecessarily_wealthy*10
    assert_equal 5100, unnecessarily_wealthy*10.2
  end
end
