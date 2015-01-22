class DifferentCurrencyCodeError<StandardError
end


class Currency
  attr_reader :amount, :code
  def initialize(amount,code=nil)
    @code=code
    @amount=amount
    @code=code
    convert_symbol
  end

  def convert_symbol
  if amount.class==String
    symbol_hash= {"$"=> :USD, "€"=> :EUR,"¥"=> :JPY}
    symbol=amount[0]
    @code=symbol_hash[symbol]
    @amount=amount[1..-1].to_i
  end
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

end
