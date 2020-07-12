# frozen_string_literal: true

require_relative 'requireable.rb'

class App
  attr_reader :stations, :trains, :routes, :carriages

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @carriages = []
  end

  def create_station
    puts 'Enter station name'
    stations << Station.new(gets.chomp)
  end

  def create_train
    puts 'Which type train'
    puts '1 - Passenger'
    puts '2 - Cargo'
    type_train = gets.chomp

    puts 'Which number train'
    number_train = gets.chomp
    trains << train_types[type_train - 1].new(number_train)
  end

  def create_route
    list_station(message_first_station: true)
    first_station = station_search(gets.chomp.to_i)

    list_station(message_last_station: true)
    last_station = station_search(gets.chomp.to_i)

    routes.push(Route.new(first_station, last_station))

    puts "Route #{route.name} create"
  end

  def add_station_route(route)
    route = list_routes_for_remove_or_add

    puts 'List of existing stations'
    list_station
    puts 'Enter number station to add?'
    route.add_station(station_search(gets.chomp.to_i))
  end

  def remove_station_route(route)
    route = list_routes_for_remove_or_add

    list_station_in_the_route
    puts 'Enter number station to delete?'
    route.delete_station(route.stations[gets.chomp.to_i - 1])
  end

  def route_assignment
    puts 'Which number train to set the route?'
    list_train
    train = train_search(gets.chomp.to_i)

    puts 'Which route to assign?'
    list_routes
    route = route_search(gets.chomp.to_i)
    train.accept_route(route)
  end

  def create_carriage
    puts 'Which type carriage'
    puts '1 - Passenger'
    puts '2 - Cargo'
    type_carriage = gets.chomp.to_i

    puts 'Which number carriage'
    case_create_carriage(gets.chomp.to_i, type_carriage)
  end

  def add_or_delete_carriage
    puts 'Enter number edit train'
    train_enter = train_search(gets.chomp)

    puts 'Add or disconnect?'
    puts '1 - Add'
    puts '2 - Disconnect'
    case_add_or_delete_carriage(gets.chomp.to_i, train_enter)
  end

  def move_train
    puts 'Enter number train'
    train_enter = train_search(gets.chomp)

    puts 'Wher are we going?'
    puts '1 - Forward'
    puts '2 - Backward'
    case_move_train(gets.chomp.to_i, train_enter)
  end

  def list_station_and_train
    puts 'Enter number'
    puts '1 - Station list'
    puts '2 - Station train list '
    case_list_station_and_train(gets.chomp.to_i)
  end

  def trains_in_station
    stations.each do |station|
      station.trains_in_station do |train|
        puts "Number train #{train.number}, 
              type #{train.class}, 
              carriages #{train.carriages.size}"
        carriages_train(train)
      end
    end
  end

  private

  def carriages_train(train)
    train.carriages_train do |carriage|
      case carriage.class.to_s
      when 'PassengerCarriage'
        info_passenger_carriage(carriage)
      when 'CargoCarriage'
        info_cargo_carriage(carriage)
      end
    end
  end

  def info_passenger_carriage(carriage)
    puts "Number carriage #{carriage.number},
          free seats #{carriage.free_seats}, 
          occupied #{carriage.occupied_seats}"
  end

  def info_cargo_carriage(carriage)
    puts "Number carriage #{carriage.number},
          available volume #{carriage.available_volume},
          occupied #{carriage.occupied_volume}"
  end

  def station_search(station_enter)
    stations[station_enter - 1]
  end

  def train_search(train_enter)
    trains.detect do |train_obj|
      train_obj.number == train_enter
    end
  end

  def route_search(route_enter)
    routes[route_enter - 1]
  end

  def carriage_search(carriage_enter)
    carriages.detect do |carriage_obj|
      carriage_obj.number == carriage_enter
    end
  end

  def list_station(message_first_station: false, message_last_station: false)
    puts 'Enter number the first station of the route' if message_first_station
    puts 'Enter number the last station of the route' if message_last_station
    stations.each.with_index(1) do |station, index|
      puts "#{index}: #{station.name}"
    end
  end

  def list_routes
    routes.each.with_index(1) do |route, index|
      puts "#{index}: #{route.name}"
    end
  end

  def list_trains_for_station
    puts 'Which station'
    station_enter = gets.chomp
    station_enter = station_search(station_enter)
    station_enter.trains.each { |train| puts train.number }
  end

  def list_train
    trains.each.with_index(1) do |train, index|
      puts "#{index}: #{train.name}"
    end
  end

  def train_types
    [PassengerTrain, CargoTrain]
  end

  def carriage_types
    [create_passenger_carriage, create_cargo_carriage]
  end

  def list_routes_for_remove_or_add
    puts 'List of existing routes'
    list_routes
    puts 'Enter number edit route'
    route_search(gets.chomp.to_i)
  end

  def create_passenger_carriage(number_carriage)
    puts 'How many passenger seats?'
    passenger_seats = gets.chomp
    number_carriage = PassengerCarriage.new(number_carriage, passenger_seats)
    carriages << number_carriage
  end

  def create_cargo_carriage(number_carriage)
    puts 'What cargo volume?'
    cargo_volume = gets.chomp
    number_carriage = CargoCarriage.new(number_carriage, cargo_volume)
    carriages << number_carriage
  end

  def add_carriage(train)
    puts 'Which carriage to add?'
    train.add_carriage(carriage_search(gets.chomp))
  end

  def delete_carriage(train)
    puts 'Which carriage to disconnect?'
    train.delete_carriage(carriage_search(gets.chomp))
  end

  def list_station_in_the_route
    puts 'List of stations in the route'
    route.stations.each.with_index(1) do |station, index|
      puts "#{index}: #{station.name}"
    end
  end

  def case_create_carriage(number, type)
    case type
    when 1
      create_passenger_carriage(number)
    when 2
      create_cargo_carriage(number)
    end
  end

  def case_add_or_delete_carriage(enter, train)
    case enter
    when 1
      add_carriage(train)
    when 2
      delete_carriage(train)
    end
  end

  def case_move_train(enter, train)
    case enter
    when 1
      train.move_forward
    when 2
      train.move_backward
    end
  end

  def case_list_station_and_train(enter)
    case enter
    when 1
      list_station
    when 2
      list_trains_for_station
    end
  end
end