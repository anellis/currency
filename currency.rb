class Currency
  attr_reader :amount, :code
  def initialize(amount,code)
    @amount=amount
    @code=code
  end

  def ==(currency)
    if @amount == currency.amount && @code== currency.code
      return true
    end
  end

  def +(currency)
    total = amount + currency.amount
    return total
  end


end
