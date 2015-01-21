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
        # {"JPY" => 0.00842, "NZD" => 0.00842, "ZAR" => 0.08625, "CAD"=> 0.82585,
        #   "AUD"=>0.81764, "INR"=>0.01621, "GBP"=> 1.51459, "EUR"=> 1.15533}
        if currency.code== "JPY"
          @conversion_rate = 0.00842
        elsif currency.code == "NZD"
          @conversion_rate = 0.76730
        elsif currency.code == "ZAR"
          @conversion_rate =  0.08625
        elsif currency.code == "CAD"
          @conversion_rate = 0.82585
        elsif currency.code == "AUD"
          @conversion_rate = 0.81764
        elsif currency.code == "INR"
          @conversion_rate = 0.01621
        elsif currency.code == "GBP"
          @conversion_rate = 1.51459
        elsif currency.code == "EUR"
          @conversion_rate = 1.15533
        end
      else
        puts "Please enter conversion rate"
        conversion_rate = gets.chomp
        conversion_rate.to_i
      end

      conversion_rate= conversion_rate.to_f
      new_code=code
      converted_amount= currency.amount * (@conversion_rate)
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
