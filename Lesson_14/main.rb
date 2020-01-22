require_relative 'app.rb'

app = App.new

loop do
  puts "Hello!"
  puts "Enter command"
  puts "1 - Create Station"
  puts "2 - Create train"
  puts "3 - Create route"
  puts "4 - Add or delete station in route"
  puts "5 - Destination train route"
  puts "6 - Create carriage"
  puts "7 - Hook or unhook carriage"
  puts "8 - Train movement in stations"
  puts "9 - View list stations and trains at the station"
  puts "0 - Exit from the program"

  command = gets.chomp

  case command
  when "1"
    app.create_station
  when "2"
    app.create_train
  when "3"
    app.create_route
  when "4"
    app.edit_station_route
  when "5"
    app.route_assignment
  when "6"
    app.create_carriage
  when "7"
    app.add_or_delete_carriage
  when "8"
    app.move_train
  when "9"
    app.view_list_station_and_train
  when "0"
    puts "Good Bay!"
    break
  end
end
