class Station

  attr_reader :trains           #геттер списка поездов

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_trains(train)         #добавление поездов на станцию
    @trains.push(train)
  end

  def departure(train)          #отправление поездов
    @trains.delete(train)
  end
end

class Route

  attr_reader :stations          #геттер списка поездов

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [first_station, last_station]
  end

  def add_station(station)      #добавление промежуточные станции в маршрут
    @stations.insert(1, station)
  end

  def delete_station(station)   #удаление промежуточной станции
    @stations.delete(station) if station != @first_station && @last_station
  end
end

class Train

  attr_accessor :speed
  attr_accessor :carriage_count
  attr_reader :station_now

  def initialize(number, type, carriage_count)
    @number = number
    @type = type
    @carriage_count = carriage_count
    @speed = 0
    @route
    @station_now
    @route_number = 0
  end

  def route_following(route)                #метод добавление маршрута
    @route = route.stations                 #добавление маршрута
    @station_now = @route[@route_number]    #постановка этого поезда на первую станцию
    @station_now.add_trains(self)           #добавление этого поезда в список поездов станции
  end

  def go_to_next_station            #отправление на следующую станцию маршрута
    @station_now.departure(self)
    @station_now = @route[@route_number += 1]
    @station_now.add_trains(self)
  end

  def go_to_last_station            #отправление на предыдущую станцию маршрута
    @station_now.departure(self)
    @station_now = @route[@route_number -= 1]
    @station_now.add_trains(self)
  end

  def next_station?
    @station_now = @route[@route_number += 1]
  end

  def last_station?
    @station_now = @route[@route_number -= 1]
  end
end
