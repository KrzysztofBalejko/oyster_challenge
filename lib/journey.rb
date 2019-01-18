require_relative 'Oystercard'

class Journey

MIN_FARE = 1

attr_accessor :card, :entry_station, :exit_station, :journey_list

  def initialize(card=Oystercard.new)
    @card = card
    @journey_list = []
  end

  def travelling?
    !!entry_station
  end

  def touch_in(station)
    fail 'insufficient funds' if @card.balance < MIN_FARE
    @journey_list << {:entry => station}
    @entry_station = station
  end

  def touch_out(station)
    deduct_fare(MIN_FARE)
    @journey_list << {:exit => station }
    set_station(station)
  end

  def set_station(station)
    @entry_station = nil
    @exit_station = station
  end

  def deduct_fare(fare)
    @card.balance -= fare
  end

  def fare
    return 6 if @entry_station.respond_to?(:to_str) && @exit_station == nil
    return 6 if @entry_station == nil && @exit_station.respond_to?(:to_str)
    MIN_FARE
  end

  private :set_station, :deduct_fare

end
