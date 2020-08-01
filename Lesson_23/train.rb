require_relative 'validator.rb'

class Train
  include Validator::Train

  attr_accessor :index_current_station
  attr_reader :carriages, :route, :number

  @@instances = 0

  def self.read_file
    File.open('train.txt') do |f|
      f.each { |line| puts line }
    end
  end

  def initialize(number)
    @@instances += 1
    @number = number
    @carriages = []
    validate(number)
    write_train
  end

  def accept_route(route)
    @route = route
    @index_current_station = 0
    route.stations[index_current_station].add_train(self)
  end

  def move_forward
    move(next_station)
  end

  def move_backward
    move(previous_station)
  end

  def add_carriage(carriage)
    carriages << carriage
  end

  def delete_carriage(carriage)
    carriages.delete(carriage)
  end

  private

  def move(index_station)
    route.stations[index_current_station].send_train(self)
    self.index_current_station = index_station
    route.stations[index_current_station].add_train(self)
  end

  def next_station
    index_current_station + 1
  end

  def previous_station
    index_current_station - 1
  end

  private

  def write_train
    File.open('train.txt', 'a') do |f|
      f.puts "#{@@instances}. Train #{self.number}"
    end
  end
end