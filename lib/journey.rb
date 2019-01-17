class Journey

  attr_accessor :entry_station, :exit_station

  def initialize(entry_station, exit_station)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def travelling?
    !!entry_station
  end

end
