load 'Station.rb'
load 'Route.rb'

class Train

  attr_accessor :speed, :current_station
  attr_reader :carriages, :route, :number

  def initialize(number)
    @number = number
    @speed = 0
    @carriages = []
  end

  def accept_route(route)       # метод добавление маршрута
    @route = route      # добавление маршрута
    @current_station = route.stations[0]   # постановка этого поезда на первую станцию
    current_station.add_train(self)     # добавление этого поезда в список поездов станции
  end

  def move_forward      # отправление на следующую станцию маршрута
    move(next_station)
  end

  def move_backward     # отправление на предыдущую станцию маршрута
    move(previous_station)
  end

  def next_station
    route.stations[+ 1]
  end

  def previous_station
    route.stations[- 1]
  end

  def add_carriage(carriage)    # добавление вагона
    carriages << carriage
  end

  def disconnect_carriage(carriage)       # удаление вагона
    carriages.delete(carriage)
  end

  private

  def move(station)             # приватный метод перемещения поезда
    self.current_station.send_train(self)
    self.current_station = station
    station.add_train(self)
  end
end
