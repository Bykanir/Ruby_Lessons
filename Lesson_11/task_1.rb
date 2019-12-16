class Station
  def initialize(name)
    @name = name
  end
end

class Route
  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
  end

  def stations
    stations = []
    stations.push(@first_station, @last_station)
  end
end

class Train
  def initialize(number, type, carriage_count)
    @number = number
    @type = type
    @carriage_count = carriage_count
    @speed = 0
  end

  def speed_gain
    @speed += 20
  end

  def current_speed
    @speed
  end

  def brake
    @speed = 0
  end

  def carriage_count
    @carriage_count
  end

  def unhooking_carriage
    @carriage_count -= 1 if @speed == 0
  end

  def trailer_carriage
    @carriage_count += 1 if @speed == 0
  end
end
