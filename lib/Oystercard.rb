class Oystercard

  LIMIT = 90

  attr_accessor :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    fail "You're over the limit #{LIMIT}" if (@balance + amount) > LIMIT
    add(amount)
  end

  def add(amount)
    @balance += amount
  end

end
