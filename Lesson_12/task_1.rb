class Station

  attr_reader :trains     # геттер списка поездов

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_trains(train)     # добавление поездов на станцию
    trains << train
  end

  def send_train(train)     # отправление поездов
    trains.delete(train)
  end
end

class Route

  attr_reader :stations     # геттер списка поездов

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [first_station, last_station]
  end

  def add_station(station)      # добавление промежуточные станции в маршрут
    @stations.insert(1, station)
  end

  def delete_station(station)     # удаление промежуточной станции
    @stations.delete(station) if station != @first_station && station != @last_station
  end
end

class Train

  attr_accessor :speed, :carriage_count
  attr_accessor :current_station
  attr_reader :next_station, :last_station

  def initialize(number, type)
    @number = number
    @type = type
    @carriage_count = 0
    @speed = 0
    @current_station_index = 0
  end

  def accept_route(route)       # метод добавление маршрута
    @route = route      # добавление маршрута
    @current_station = @route.stations[0]   # постановка этого поезда на первую станцию
    @current_station.add_trains(self)     # добавление этого поезда в список поездов станции
  end

  def move_forward      # отправление на следующую станцию маршрута
    @current_station.send_train(self)
    @current_station = @route.stations[@current_station_index += 1]
    @current_station.add_trains(self)
  end

  def move_backward     # отправление на предыдущую станцию маршрута
    @current_station.send_train(self)
    @current_station = @route.stations[@current_station_index -= 1]
    @current_station.add_trains(self)
  end

  def next_station          # есть геттер, может нужно вывести переменную в инициализацию?
    @route.stations[@current_station_index += 1]
  end

  def last_station          # смореть на next_station
    @route.stations[@current_station_index -= 1]
  end
end
