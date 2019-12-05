class Station
  def initilize
    @title
  end
end

class Route
  def initilize
    @first_station
    @last_station
  end

  def list_station
    return @first_station, @last_station
  end
end

class Train
  def initilize
    @number
    @type
    @carriage_count
    @speed
  end

  def speed_gain
    @speed = 20
  end

  def current_speed
    return @speed
  end

  def brake
    @speed = 0
  end

  def carriage_count
    return @carriage_count
  end

  def unhooking_carriage
    @carriage_count - 1 if @speed == 0
  end

  def trailer_carriage
    @carriage_count + 1 if @speed == 0
  end
end
