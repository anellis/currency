class DifferentCurrencyCodeError<StandardError
end

class Currency
  attr_reader :amount, :code
  def initialize(amount,code)
    @amount=amount
    @code=code
    @currency_rates= {USD: 1.0, EUR: 0.74}
  end

  def ==(currency)
    if @amount == currency.amount && @code== currency.code
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

  def convert(currency, code)
    if code==currency.code && amount== currency.amount
      Currency.new(amount, code)
    end
  end
end
