class Oystercard

  LIMIT = 90
  MIN_FARE = 1

  attr_accessor :balance, :entry_station, :exit_station, :journey_list

  def initialize(balance = 0)
    @balance = balance
    # @entry_station = nil
    @journey_list = []
  end

  def travelling?
    !!entry_station
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

  def touch_in(station)
    if @balance < MIN_FARE
      fail 'insufficient funds'
    end
      @journey_list << {:entry => station}
      @entry_station = station
  end

  def touch_out(station)
    deduct_fare(MIN_FARE)
    @journey_list[0][:exit] = station
    @entry_station = nil
    @exit_station = station
  end

  private :add, :deduct_fare


end
