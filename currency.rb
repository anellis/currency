class DifferentCurrencyCodeError<StandardError
end

class Currency
  attr_reader :amount, :code
  def initialize(amount,code)
    @amount=amount
    @code=code
    @currency_rates= {USD: 1.0, EUR: 0.74, JPY: 120.0}
  end

  def ==(currency)
    if @amount == currency.amount && @code == currency.code
      return true
    end
  end

  def +(currency)
    if code == currency.code
      total = amount + currency.amount
    else
      raise DifferentCurrencyCodeError, "You cannot add two currencies with different codes"
    end
  end

  def -(currency)
    if code == currency.code
      total = amount - currency.amount
    else
      raise DifferentCurrencyCodeError, "You cannot subtract two currencies with different codes"
    end
  end

  def *(number)
    new_amount= amount*number
    Currency.new(new_amount, code)
  end

  def convert(other_code)
    if self.code==other_code
      Currency.new(amount, code)
    else
      new_amount = amount * @currency_rates[other_code]
      Currency.new(new_amount,other_code)
    end
  end
end
