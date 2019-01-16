class Oystercard

  LIMIT = 90
  MIN_FARE = 1

  attr_accessor :balance, :journey

  def initialize(balance = 0, journey = false)
    @balance = balance
    @journey = journey
  end

  def top_up(amount)
    fail "You're over the limit #{LIMIT}" if (@balance + amount) > LIMIT
    add(amount)
  end

  def add(amount)
    @balance += amount
  end

  def deduct_fare(fare)
    @balance -= fare
  end

  def touch_in
    if @balance < MIN_FARE
      fail 'insufficient funds'
    end
      @journey = true
  end


  def touch_out
    deduct_fare(MIN_FARE)
    @journey = false
  end

  private :add, :deduct_fare


end
