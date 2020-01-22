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
    station_name = gets.chomp
    station_name = Station.new(station_name)
    stations.push(station_name)
  end

  def create_train                               # создание поезда
    puts "Which type train"
    puts "1 - Passenger"
    puts "2 - Cargo"
    type_train = gets.chomp

    puts "Which number train"
    number_train = gets.chomp
    if type_train == "1"
      number_train = PassengerTrain.new(number_train)
      trains.push(number_train)
    elsif type_train == "2"
      number_train = CargoTrain.new(number_train)
      trains.push(number_train)
    end
  end

  def create_route                               # создание маршрута
    puts "Enter name the first station of the route"
    first_station_enter = gets.chomp
    first_station = station_search(first_station_enter)

    puts "Enter name the last station of the route"
    last_station_enter = gets.chomp
    last_station = station_search(last_station_enter)

    puts "Enter name route"
    route_name = gets.chomp
    route_name = Route.new(route_name, first_station, last_station)
    routes.push(route_name)
  end

  def edit_station_route                         # редактирование маршрута
    puts "Enter edit route"
    route_enter = gets.chomp
    route_enter = route_search(route_enter)

    puts "Add or remove?"
    puts "1 - Add"
    puts "2 - Remove"
    enter = gets.chomp
    if enter == "1"                              # добавление станции в маршрут
      puts "Which station to add?"
      station_add = gets.chomp
      station_add = station_search(station_add)
      route.add_station(station_add)
    elsif enter == "2"                          # удаления станции из машрута
      puts "Which station to delete?"
      station_delete = gets.chomp
      station_delete = station_search(station_delete)
      route.delete_station(station_delete)
    end
  end

  def route_assignment                          # назначение маршрута поезду
    puts "Which number train to set the route?"
    train_enter = gets.chomp
    train_enter = train_search(train_enter)

    puts "Which route to assign?"
    route_enter = gets.chomp
    route = routes.detect do |route_obj|
      route_obj.name == route_enter
    end
    train_enter.accept_route(route)
  end

  def create_carriage                           # создание вагона
    puts "Which type carriage"
    puts "1 - Passenger"
    puts "2 - Cargo"
    type_carriage = gets.chomp

    puts "Which number carriage"
    number_carriage = gets.chomp
    if type_carriage == "1"
      puts "How many passenger seats?"
      passenger_seats = gets.chomp
      number_carriage = PassengerCarriage.new(number_carriage, passenger_seats)
      carriages.push(number_carriage)
    elsif type_carriage == "2"
      puts "What cargo volume?"
      cargo_volume = gets.chomp
      number_carriage = CargoCarriage.new(number_carriage, cargo_volume)
      carriages.push(number_carriage)
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
      puts "Which carriage to add?"
      carriage_add = gets.chomp
      carriage_add = carriage_search(carriage_add)
      train_enter.add_carriage(carriage_add)
    elsif enter == "2"                          # отцепка вагона от поезда
      puts "Which carriage to disconnect?"
      carriage_delete = gets.chomp
      carriage_delete = carriage_search(carriage_delete)
      train_enter.delete_carriage(carriage_delete)
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

  def view_list_station_and_train               # посмотр списка станций и поездов на станции
    puts "Enter number"
    puts "1 - Station list"
    puts "2 - Station train list "
    enter = gets.chomp
    if enter == "1"
      stations.each { |station| puts station.name }
    elsif enter == "2"
      puts "Which station"
      station_enter = gets.chomp
      station_enter = station_search(station_enter)
      station_enter.trains.each { |train| puts train.number }
    end
  end

  private

  def station_search(station_enter)
    stations.detect do |station_obj|
      station_obj.name == station_enter
    end
  end

  def train_search(train_enter)
    trains.detect do |train_obj|
      train_obj.number == train_enter
    end
  end

  def route_search(route_enter)
    routes.detect do |route_obj|
      route_obj.name == route_enter
    end
  end

  def carriage_search(carriage_enter)
    carriages.detect do |carriage_obj|
      carriage_obj.number == carriage_enter
    end
  end
end
