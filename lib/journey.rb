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
    if @card.balance < MIN_FARE
      fail 'insufficient funds'
    end
      @journey_list << {:entry => station}
      @entry_station = station
  end

  def touch_out(station)
    deduct_fare(MIN_FARE)
    # @journey_list[0][:exit] = station
    @journey_list << {:exit => station }
    @entry_station = nil
    @exit_station = station
  end

  def deduct_fare(fare)
    @card.balance -= fare
  end

  def fare
    if @entry_station.respond_to?(:to_str) && @exit_station == nil
      return 6
    elsif @entry_station == nil && @exit_station.respond_to?(:to_str)
      return 6
    end
    MIN_FARE
  end



end
