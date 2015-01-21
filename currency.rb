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
    if code == currency.code
      total = amount + currency.amount
    else
      if code== "USD"
        @conversion_rates= {"JPY" => 0.00842, "NZD" => 0.00842, "ZAR" => 0.08625, "CAD"=> 0.82585,
          "AUD"=>0.81764, "INR"=>0.01621, "GBP"=> 1.51459, "EUR"=> 1.15533}
      else
        puts "Please enter conversion rate"
        conversion_rate = gets.chomp
        conversion_rate.to_i
      end

      conversion_rate= conversion_rate.to_f
      new_code=code
      converted_amount= currency.amount * (@conversion_rates[code])
      new_amount= amount + converted_amount
      Currency.new(new_amount, new_code)
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
