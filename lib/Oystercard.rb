class Oystercard

  LIMIT = 91

  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    fail "You're over the limit #{LIMIT}" if (@balance + amount) >= LIMIT
      @balance += amount
  end

end
