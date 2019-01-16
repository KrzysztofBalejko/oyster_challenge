class Oystercard

  LIMIT = 90

  attr_accessor :balance, :journey

  def initialize(balance = 0, journey = false)
    @balance = balance
    @journey = journey
  end

  def top_up(amount)
    fail "You're over the limit #{LIMIT}" if (@balance + amount) > LIMIT
      @balance += amount
  end

  def deduct_fare(fare)
    @balance -= fare
  end

  def touch_in
    if @balance < 1
      fail 'insufficient funds'
    end
      @journey = true
  end


  def touch_out
    @journey = false
  end


end
