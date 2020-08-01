require_relative 'app.rb'

app = App.new

['Moscow', 'Saint Petersburg', 'Volgodonsk'].each do |name|
  app.stations << Station.new(name)
end

3.times { app.routes << Route.new(app.stations.sample, app.stations.sample) }

['Passenger train #1', 'Passenger train #2', 'Passenger train #1'].each do |number|
  app.trains << PassengerTrain.new(number)
end

['Cargo train #1', 'Cargo train #2', 'Cargo train #3'].each do |number|
  app.trains << CargoTrain.new(number)
end

['Passenger carriage #11', 'Passenger carriage #22', 'Passenger carriage #33'].each do |number|
  app.carriages << PassengerCarriage.new(number, 20)
end

['Cargo carriage #111', 'Cargo carriage #222', 'Cargo carriage #333'].each do |number|
  app.carriages << CargoCarriage.new(number, 1000)
end

app.trains.each { |train| train.accept_route(app.routes.sample) }

app.trains.each { |train| train.add_carriage(app.carriages.sample) }