class Route

  attr_reader :stations, :first_station, :last_station, :name     # геттер списка станций

  @@routes = {}

  class << self
    def all
      @@routes
    end
  end

  def initialize(name, first_station, last_station)
    @name = name
    @first_station = first_station
    @last_station = last_station
    @stations = [first_station, last_station]
    @@routes.store(name, stations)
  end

  def add_station(station)      # добавление промежуточные станции в маршрут
    stations.insert(1, station)
  end

  def delete_station(station)     # удаление промежуточной станции
    stations.delete(station) if station != first_station && station != last_station
  end
end
