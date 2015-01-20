class Currency
  attr_reader :amount, :code
  def initialize(amount,code)
    @amount=amount
    @code=code
  end

  # def convert_currency(currency)
  #   if code== "USD"
  #     if currency.code== "JPY"
  #       @conversion_rate = 0.00842
  #     elsif currency.code == "NZD"
  #       @conversion_rate = 0.76730
  #     elsif currency.code == "ZAR"
  #       @conversion_rate = * 0.08625
  #     elsif currency.code == "CAD"
  #       @conversion_rate = 0.82585
  #     elsif currency.code == "AUD"
  #       @conversion_rate = 0.81764
  #     elsif currency.code == "INR"
  #       @conversion_rate = 0.01621
  #     elsif currency.code == "GBP"
  #       @conversion_rate = 1.51459
  #     elsif currency.code == "EUR"
  #       @conversion_rate = 1.15533
  #     end
  #   else
  #     puts "Please enter conversion rate"
  #     conversion_rate = gets.chomp
  #     conversion_rate.to_i
  #   end
  # end

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
        if currency.code== "JPY"
          @conversion_rate = 0.00842
        elsif currency.code == "NZD"
          @conversion_rate = 0.76730
        elsif currency.code == "ZAR"
          @conversion_rate = 0.08625
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
      # raise DifferentCurrencyCodeError, "You cannot add two currencies with different codes"
      # puts "Please enter conversion rate"
      # conversion_rate = gets.chomp
      conversion_rate= conversion_rate.to_f
      new_code=code
      # @conversion_rate = 0.00842
      converted_amount= currency.amount * (@conversion_rate)
      new_amount= amount + converted_amount
      Currency.new(new_amount, new_code)
    end
  end

  def -(currency)
    # if code == currency.code
      total = amount - currency.amount
    # else
    #   raise DifferentCurrencyCodeError, "You cannot subtract two currencies with different codes"
    # end
  end

  def *(number)
      total = amount * number
  end




end
#
# class DifferentCurrencyCodeError<StandardError
# end
