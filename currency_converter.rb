class UnknownCurrencyCodeError<StandardError
end

class CurrencyConverter
  attr_reader :conversion_rates
  def initialize(conversion_rates)
    @conversion_rates= conversion_rates
  end

  def convert(currency, other_code)
    if conversion_rates[other_code]== nil
      raise UnknownCurrencyCodeError, "Unknown currency code"
    elsif currency.code==other_code
      Currency.new(currency.amount, currency.code)
    else
      new_amount = (conversion_rates[other_code]/ currency.amount ).round(2)
      Currency.new(new_amount,other_code)
    end
  end

end

# new_amount = currency.amount * conversion_rates[other_code] / conversion_rates[currency.code]
