require_relative 'requireable.rb'

class App

  attr_reader :stations, :trains, :routes, :carriages

  def initialize
    @stations = []                          # массив созданных станций
    @trains = []                            # массив созданных поездов
    @routes = []                            # массив созданных маршрутов
    @carriages = []                          # массив созданных поездов
  end

  def create_station                             # создание станции
    puts "Enter station name"
    stations << Station.new(gets.chomp)
  end

  def create_train                               # создание поезда
    puts "Which type train"
    puts "1 - Passenger"
    puts "2 - Cargo"
    type_train = gets.chomp

    puts "Which number train"
    number_train = gets.chomp
    trains << train_types[type_train - 1].new(number_train)
  end

  def create_route                               # создание маршрута
    puts "Enter number the first station of the route"
    list_station
    first_station = station_search(gets.chomp.to_i)

    puts "Enter number the last station of the route"
    list_station
    last_station = station_search(gets.chomp.to_i)

    route = Route.new(first_station, last_station)
    routes.push(route)

    puts "Route #{route.name} create"
  end

  def edit_route                         # редактирование маршрута
    puts "List of existing routes"
    list_routes
    puts "Enter number edit route"
    route = route_search(gets.chomp.to_i)

    puts "Add or remove?"
    puts "1 - Add"
    puts "2 - Remove"
    enter = gets.chomp
    if enter == "1"                              # добавление станции в маршрут
      add_station(route)
    elsif enter == "2"                          # удаления станции из машрута
      remove_station_route(route)
    end
  end

  def route_assignment                          # назначение маршрута поезду
    puts "Which number train to set the route?"
    list_train
    train = train_search(gets.chomp.to_i)

    puts "Which route to assign?"
    list_routes
    route = route_search(gets.chomp.to_i)
    train.accept_route(route)
  end

  def create_carriage                           # создание вагона
    puts "Which type carriage"
    puts "1 - Passenger"
    puts "2 - Cargo"
    type_carriage = gets.chomp

    puts "Which number carriage"
    number_carriage = gets.chomp
    if type_carriage == "1"
      create_passenger_carriage(number_carriage)
    elsif type_carriage == "2"
      create_cargo_carriage(number_carriage)
    end
  end

  def add_or_delete_carriage
    puts "Enter number edit train"
    train_enter = gets.chomp
    train_enter = train_search(train_enter)

    puts "Add or disconnect?"
    puts "1 - Add"
    puts "2 - Disconnect"
    enter = gets.chomp
    if enter == "1"                              # добавление вагона к поезду
      add_carriage
    elsif enter == "2"                          # отцепка вагона от поезда
      delete_carriage
    end
  end

  def move_train                                # движение поезда по станциям
    puts "Enter number train"
    train_enter = gets.chomp
    train_enter = train_search(train_enter)

    puts "Wher are we going?"
    puts "1 - Forward"
    puts "2 - Backward"
    enter = gets.chomp
    if enter == "1"
      train_enter.move_forward
    elsif enter == "2"
      train_enter.move_backward
    end
  end

  def list_station_and_train               # посмотр списка станций и поездов на станции
    puts "Enter number"
    puts "1 - Station list"
    puts "2 - Station train list "
    enter = gets.chomp
    if enter == "1"
      list_station
    elsif enter == "2"
      list_trains_for_station
    end
  end

  private

  def station_search(station_enter)
    stations[station_enter - 1]
  end

  def train_search(train_enter)
    trains.detect do |train_obj|
      train_obj.number == train_enter
    end
  end

  def train_search(train_enter)
    trains[train_enter - 1]
  end

  def route_search(route_enter)
    routes[route_enter - 1]
  end

  def carriage_search(carriage_enter)
    carriages.detect do |carriage_obj|
      carriage_obj.number == carriage_enter
    end
  end

  def list_station
    stations.each_with_index do |station, index|
      puts "#{index + 1}: #{station.name}"
    end
  end

  def list_routes
    routes.each_with_index do |route, index|
      puts "#{index + 1}: #{route.name}"
    end
  end

  def list_trains_for_station
    puts "Which station"
    station_enter = gets.chomp
    station_enter = station_search(station_enter)
    station_enter.trains.each { |train| puts train.number }
  end

  def list_train
    trains.each_with_index do |train, index|
      puts "#{index + 1}: #{train.name}"
    end
  end

  def train_types
    [PassengerTrain, CargoTrain]
  end

  def add_station(route)
    puts "List of existing stations"
    list_station
    puts "Enter number station to add?"
    station_add = station_search(gets.chomp.to_i)
    route.add_station(station_add)
  end

  def remove_station_route(route)
    puts "List of stations in the route"
    route.stations.each_with_index do |station, index|
      puts "#{index + 1}: #{station.name}"
    end
    puts "Enter number station to delete?"
    station_delete = gets.chomp.to_i
    route.delete_station(route.stations[station_delete - 1])
  end

  def create_passenger_carriage(number_carriage)
    puts "How many passenger seats?"
    passenger_seats = gets.chomp
    number_carriage = PassengerCarriage.new(number_carriage, passenger_seats)
    carriages.push(number_carriage)
  end

  def create_cargo_carriage(number_carriage)
    puts "What cargo volume?"
    cargo_volume = gets.chomp
    number_carriage = CargoCarriage.new(number_carriage, cargo_volume)
    carriages.push(number_carriage)
  end

  def add_carriage
    puts "Which carriage to add?"
    carriage_add = gets.chomp
    carriage_add = carriage_search(carriage_add)
    train_enter.add_carriage(carriage_add)
  end

  def delete_carriage
    puts "Which carriage to disconnect?"
    carriage_delete = gets.chomp
    carriage_delete = carriage_search(carriage_delete)
    train_enter.delete_carriage(carriage_delete)
  end
end
