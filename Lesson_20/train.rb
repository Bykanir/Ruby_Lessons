require_relative 'validator.rb'

class Train
  include Validator
  
  attr_accessor :speed, :index_current_station
  attr_reader :carriages, :route, :number

  def initialize(number)
    @number = number
    @speed = 0
    @carriages = []
    validate_number(number)
  end

  def accept_route(route)       # метод добавление маршрута
    @route = route      # добавление маршрута
    @index_current_station = 0   # постановка этого поезда на первую станцию
    route.stations[index_current_station].add_train(self) # добавление этого поезда в список поездов станции
  end

  def move_forward      # отправление на следующую станцию маршрута
    move(next_station)
  end

  def move_backward     # отправление на предыдущую станцию маршрута
    move(previous_station)
  end

  def next_station
    index_current_station + 1
  end

  def previous_station
    index_current_station - 1
  end

  def add_carriage(carriage)    # добавление вагона
    carriages << carriage
  end

  def delete_carriage(carriage)       # удаление вагона
    carriages.delete(carriage)
  end

  private

  def move(index_station)             # приватный метод перемещения поезда
    self.route.stations[index_current_station].send_train(self)
    self.index_current_station = index_station
    route.stations[index_current_station].add_train(self)
  end
end
