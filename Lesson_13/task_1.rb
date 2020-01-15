class Station

  attr_reader :trains     # геттер списка поездов

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)     # добавление поездов на станцию
    trains << train
  end

  def send_train(train)     # отправление поездов
    trains.delete(train)
  end
end

class Route

  attr_reader :stations, :first_station, :last_station     # геттер списка поездов

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [first_station, last_station]
  end

  def add_station(station)      # добавление промежуточные станции в маршрут
    stations.insert(1, station)
  end

  def delete_station(station)     # удаление промежуточной станции
    stations.delete(station) if station != first_station && station != last_station
  end
end

class PassengerTrain

  attr_accessor :speed, :current_station
  attr_reader :carriages, :route

  def initialize(number)
    @number = number
    @speed = 0
    @carriages = []
  end

  def accept_route(route)       # метод добавление маршрута
    @route = route      # добавление маршрута
    @current_station = @route.stations[0]   # постановка этого поезда на первую станцию
    @current_station.add_train(self)     # добавление этого поезда в список поездов станции
  end

  def move_forward      # отправление на следующую станцию маршрута
    move(next_station)
  end

  def move_backward     # отправление на предыдущую станцию маршрута
    move(previous_station)
  end

  def next_station          # есть геттер, может нужно вывести переменную в инициализацию?
    @route.stations[+ 1]
  end

  def previous_station          # смореть на next_station
    @route.stations[- 1]
  end

  def add_carriage(carriage)
    carriages << carriage if carriage.is_a?(PassengerCarriage)
  end

  private

  def move(station)             # приватный метод перемещения поезда
    @current_station.send_train(self)
    self.current_station = station
    @current_station.add_train(self)
  end
end

class CargoTrain

  attr_accessor :speed, :current_station
  attr_reader :carriages, :route

  def initialize(number)
    @number = number
    @speed = 0
    @carriages = []
  end

  def accept_route(route)       # метод добавление маршрута
    @route = route      # добавление маршрута
    @current_station = @route.stations[0]   # постановка этого поезда на первую станцию
    @current_station.add_train(self)     # добавление этого поезда в список поездов станции
  end

  def move_forward      # отправление на следующую станцию маршрута
    move(next_station)
  end

  def move_backward     # отправление на предыдущую станцию маршрута
    move(previous_station)
  end

  def next_station          # есть геттер, может нужно вывести переменную в инициализацию?
    @route.stations[+ 1]
  end

  def previous_station          # смореть на next_station
    @route.stations[- 1]
  end

  def add_carriage(carriage)
    carriages << carriage if carriage.is_a?(CargoCarriage)
  end

  private

  def move(station)         # приватный метод перемещения поезда
    @current_station.send_train(self)
    self.current_station = station
    @current_station.add_train(self)
  end
end

class PassengerCarriage

  def initialize(seats)
    @seats = seats
  end
end

class CargoCarriage

  def initialize(volume)
    @volume = volume
  end
end
