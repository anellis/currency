require 'minitest/autorun'
require 'minitest/pride'
require './currency'

# CurrencyConverter:
#
# Should be initialized with a Hash of currency codes to conversion rates (see link to rates below)
# At first, just make this work with two currency codes and conversation rates,
# with one rate being 1.0 and the other being the conversation rate.
# An example would be this: {USD: 1.0, EUR: 0.74}, which implies that a dollar is worth 0.74 euros.
# Should be able to take a Currency object and a requested currency code that is the same currency
# code as the Currency object's and return a Currency object equal to the one passed
# in (that is, currency_converter.convert(Currency.new(1, :USD), :USD) == Currency.new(1, :USD))
# Should be able to take a Currency object that has one currency code it knows and a requested
# currency code and return a new Currency object with the right amount in the new currency code
# Should be able to be created with a Hash of three or more currency codes and conversion rates.
# An example would be this: {USD: 1.0, EUR: 0.74, JPY: 120.0}, which implies that a dollar is worth
# 0.74 euros and that a dollar is worth 120 yen, but also that a euro is worth 120/0.74 = 162.2 yen.
# Should be able to convert Currency in any currency code it knows about to Currency in any other
# currency code it knows about.
# Should raise an UnknownCurrencyCodeError when you try to convert from or to a currency code
# it doesn't know about.
# Currency (modifications to earlier code):
#
# Currency.new should be able to take one argument with a currency symbol embedded in it,
# like "$1.20" or "€ 7.00", and figure out the correct currency code. It can also take two
# arguments like before, one being the amount and the other being the currency code.

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
    assert_raises(DifferentCurrencyCodeError) do
      rich + middle_class
    end
  end

  def test_can_be_multiplied_by_fixnum_or_float
    unnecessarily_wealthy= Currency.new(500, "ARS")
    assert_equal unnecessarily_wealthy*10, Currency.new(5000,"ARS")
    assert_equal unnecessarily_wealthy*10.2, Currency.new(5100, "ARS")
  end

  def test_convert_method_is_present
    other= Currency.new(.74, :EUR)
    assert other.convert(Currency.new(1, :USD), :USD) == Currency.new(.74, :USD))
  end
end
