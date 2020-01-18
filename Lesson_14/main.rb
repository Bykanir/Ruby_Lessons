load 'Station.rb'
load 'CargoTrain.rb'
load 'PassengerTrain.rb'
load 'CargoCarriage.rb'
load 'PassengerCarriage.rb'
load 'Route.rb'

class App

  attr_reader :stations_list, :trains_list, :routes_list, :carriages_list

  def initialize
    @stations_list = []                          # массив созданных станций
    @trains_list = []                            # массив созданных поездов
    @routes_list = []                            # массив созданных маршрутов
    @carriages_list = []                          # массив созданных поездов
  end

  def create_station                             # создание станции
    puts "Enter station name"
    station_name = gets.chomp
    station_name = Station.new(station_name)
    stations_list.push(station_name)
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
      trains_list.push(number_train)
    elsif type_train == "2"
      number_train = CargoTrain.new(number_train)
      trains_list.push(number_train)
    end
  end

  def create_route                               # создание маршрута
    puts "Enter name the first station of the route"
    first_station_enter = gets.chomp
    first_station = stations_list.detect do |station_obj|
      station_obj.name == first_station_enter
    end

    puts "Enter name the last station of the route"
    last_station_enter = gets.chomp
    last_station = stations_list.detect do |station_obj|
      station_obj.name == last_station_enter
    end

    puts "Enter name route"
    route_name = gets.chomp
    route_name = Route.new(route_name, first_station, last_station)
    routes_list.push(route_name)
  end

  def edit_station_route                         # редактирование маршрута
    puts "Enter edit route"
    route_enter = gets.chomp
    route = routes_list.detect do |route_obj|
      route_obj.name == route_enter
    end

    puts "Add or remove?"
    puts "1 - Add"
    puts "2 - Remove"
    enter = gets.chomp
    if enter == "1"                              # добавление станции в маршрут
      puts "Which station to add?"
      station_add = gets.chomp
      station_add = stations_list.detect do |station_obj|
        station_obj.name == station_add
      end
      route.add_station(station_add)
    elsif enter == "2"                          # удаления станции из машрута
      puts "Which station to delete?"
      station_delete = gets.chomp
      station_delete = stations_list.detect do |station_obj|
        station_obj.name == station_delete
      end
      route.delete_station(station_delete)
    end
  end

  def route_assignment                          # назначение маршрута поезду
    puts "Which number train to set the route?"
    train_enter = gets.chomp
    train_enter = trains_list.detect do |train_obj|
      train_obj.number == train_enter
    end

    puts "Which route to assign?"
    route_enter = gets.chomp
    route = routes_list.detect do |route_obj|
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
      carriages_list.push(number_carriage)
    elsif type_carriage == "2"
      puts "What cargo volume?"
      cargo_volume = gets.chomp
      number_carriage = CargoCarriage.new(number_carriage, cargo_volume)
      carriages_list.push(number_carriage)
    end
  end

  def add_or_disconnect_carriage
    puts "Enter number edit train"
    train_enter = gets.chomp
    train_enter = trains_list.detect do |train_obj|
      train_obj.number == train_enter
    end

    puts "Add or disconnect?"
    puts "1 - Add"
    puts "2 - Disconnect"
    enter = gets.chomp
    if enter == "1"                              # добавление вагона к поезду
      puts "Which carriage to add?"
      carriage_add = gets.chomp
      carriage_add = carriages_list.detect do |carriage_obj|
        carriage_obj.number == carriage_add
      end
      train_enter.add_carriage(carriage_add)
    elsif enter == "2"                          # отцепка вагона от поезда
      puts "Which carriage to disconnect?"
      carriage_delete = gets.chomp
      carriage_delete = carriages_list.detect do |carriage_obj|
        carriage_obj.number == carriage_delete
      end
      train_enter.disconnect_carriage(carriage_delete)
    end
  end

  def move_train                                # движение поезда по станциям
    puts "Enter number train"
    train_enter = gets.chomp
    train_enter = trains_list.detect do |train_obj|
      train_obj.number == train_enter
    end

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
      stations_list.each { |station| puts station.name }
    elsif enter == "2"
      puts "Which station"
      station_enter = gets.chomp
      station_enter = stations_list.detect do |station_obj|
        station_obj.name == station_enter
      end
      station_enter.trains.each { |train| puts train.number }
    end
  end
end
