# frozen_string_literal: true

require_relative 'app.rb'

app = App.new

loop do
  puts 'Hello!'
  puts 'Enter command'
  puts '1 - Create Station'
  puts '2 - Create train'
  puts '3 - Create route'
  puts '4 - Add station in route'
  puts '5 - Delete station in route'
  puts '6 - Destination train route'
  puts '7 - Create carriage'
  puts '8 - Hook or unhook carriage'
  puts '9 - Train movement in stations'
  puts '10 - View list stations and trains at the station'
  puts '0 - Exit from the program'

  command = gets.chomp

  case command
  when '1'
    app.create_station
  when '2'
    app.create_train
  when '3'
    app.create_route
  when '4'
    app.add_station_route
  when '5'
    app.remove_station_route
  when '6'
    app.route_assignment
  when '7'
    app.create_carriage
  when '8'
    app.add_or_delete_carriage
  when '9'
    app.move_train
  when '10'
    app.list_station_and_train
  when '0'
    puts 'Good Bay!'
    break
  end
end
