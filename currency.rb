class Currency
  def initialize(amount,code)
    @amount=amount
    @code=code
  end

  def equal(currency)
    if @amount == @amount && @code==@code
      equal= true
    else
      equal= false
    end
    equal
  end

end
