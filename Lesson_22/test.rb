# frozen_string_literal: true

require_relative 'app.rb'

station_1 = Station.new('Moscow')
station_2 = Station.new('Saint Petersburg')
station_3 = Station.new('Volgodonsk')

app.stations.push(station_1, station_2, station_3)

route_1 = Route.new(station_1, station_2)
route_2 = Route.new(station_2, station_3)
route_3 = Route.new(station_3, station_1)

app.routes.push(route_1, route_2, route_3)

passenger_train_1 = PassengerTrain.new('Passenger train #1')
passenger_train_2 = PassengerTrain.new('Passenger train #2')
passenger_train_3 = PassengerTrain.new('Passenger train #3')

cargo_train_1 = CargoTrain.new('Cargo train #1')
cargo_train_2 = CargoTrain.new('Cargo train #2')
cargo_train_3 = CargoTrain.new('Cargo train #3')

app.trains.push(passenger_train_1, passenger_train_2, passenger_train_3,
                cargo_train_1, cargo_train_2, cargo_train_3)

passenger_carriage_1 = PassengerCarriage.new('Passenger carriage #11', 20)
passenger_carriage_2 = PassengerCarriage.new('Passenger carriage #22', 20)
passenger_carriage_3 = PassengerCarriage.new('Passenger carriage #33', 20)

cargo_carriage_1 = CargoCarriage.new('Cargo carriage #111', 1000)
cargo_carriage_2 = CargoCarriage.new('Cargo carriage #222', 1000)
cargo_carriage_3 = CargoCarriage.new('Cargo carriage #333', 1000)

app.carriages.push(passenger_carriage_1, passenger_carriage_2, 
                    passenger_carriage_3, cargo_carriage_1, 
                    cargo_carriage_2, cargo_carriage_3)

p '---'
cargo_train_1.accept_route(route_1)
cargo_train_2.accept_route(route_2)
cargo_train_3.accept_route(route_3)
passenger_train_1.accept_route(route_1)
passenger_train_2.accept_route(route_2)
passenger_train_3.accept_route(route_3)

cargo_train_1.add_carriage(cargo_carriage_1)
cargo_train_2.add_carriage(cargo_carriage_2)
cargo_train_3.add_carriage(cargo_carriage_3)
passenger_train_1.add_carriage(passenger_carriage_1)
passenger_train_2.add_carriage(passenger_carriage_2)
passenger_train_3.add_carriage(passenger_carriage_3)