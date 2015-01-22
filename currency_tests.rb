require 'minitest/autorun'
require 'minitest/pride'
require './currency'
require './currency_converter'

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

  def test_currency_converter_class_exists
    assert CurrencyConverter
  end

  def test_initialized_with_hash
    new_money= CurrencyConverter.new({USD: 1.0, EUR: 0.74})
    assert_equal ({USD:1.0, EUR:0.74}), new_money.conversion_rates
  end

  def test_convert_of_same_code
    currency=CurrencyConverter.new({USD: 1.0, EUR: 0.74})
    currency1= Currency.new(1, :USD)
    assert_equal Currency.new(1, :USD), currency.convert(currency1, :USD)
  end

  def test_convert_of_different_codes_converts_to_new_code
    currency=CurrencyConverter.new({USD: 1.0, EUR: 0.74})
    currency1= Currency.new(1, :USD)
    assert_equal Currency.new(0.74, :EUR), currency.convert(currency1, :EUR)
    # assert_equal currency1.convert(:JPY), Currency.new(120, )
  end

  def test_can_have_three_or_more_codes
    currency= CurrencyConverter.new({USD: 1.0, EUR: 0.74, JPY: 120.0})
    currency1= Currency.new(1, :USD)
    currency2= Currency.new(0.74, :EUR)

    assert_equal Currency.new(0.74, :EUR), currency.convert(currency1, :EUR)
    assert_equal Currency.new(162.16, :JPY), currency.convert(currency2, :JPY)
  end

  def test_unkown_currency_code_error
    currency= CurrencyConverter.new({USD: 1.0, EUR: 0.74, JPY: 120.0})
    currency1= Currency.new(1, :USD)
    assert_raises(UnknownCurrencyCodeError) do
      currency.convert(currency1, :GBP)
    end
  end

  def test_currency_should_take_symbol_parameter
    currency= Currency.new("$1")
    assert_equal Currency.new(1, :USD), currency
  end

end
