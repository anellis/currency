require 'minitest/autorun'
require 'minitest/pride'
require './currency'

# Requirements
#
# Currency:

# Should be created with an amount and a currency code
# Should equal another Currency object with the same amount and currency code
# Should be able to be added to another Currency object with the same currency code
# Should be able to be subtracted by another Currency object with the same currency code
# Should raise a DifferentCurrencyCodeError when you try to add or subtract two Currency objects with different currency codes.
# Should be able to be multiplied by a Fixnum or Float and return a Currency object
# Normal Mode
#
# You will be using Test-Driven Development to design two Ruby classes, Currency (tonight) and CurrencyConverter (tomorrow night). The Requirements section above contains a list of all the things Currency should do. In order to complete this assignment, follow these directions:
#
#   For each requirement, write a test first, and then make the test pass, no exceptions, do not pass Go, do not collect $200.
#     Every time you finish a requirement, commit your code with a message describing the requirement.
#     Go through the requirements one-by-one. Do not skip around.

class CurrencyTest <Minitest::Test
  def test_currency_class_exists
    assert Currency
  end
end
