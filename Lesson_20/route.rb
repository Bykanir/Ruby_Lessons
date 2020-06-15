require_relative 'validator.rb'

class Route
  include Validator
  
  attr_reader :stations, :first_station, :last_station, :name     # геттер списка станций

  def initialize(first_station, last_station)
    @name = "#{first_station.name} - #{last_station.name}"
    @first_station = first_station
    @last_station = last_station
    @stations = [first_station, last_station]
    name_valid?(name)
  end

  def add_station(station)      # добавление промежуточные станции в маршрут
    stations.insert(1, station)
  end

  def delete_station(station)     # удаление промежуточной станции
    stations.delete(station) if station != first_station && station != last_station
  end
end
