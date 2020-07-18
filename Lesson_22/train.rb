# frozen_string_literal: true

require_relative 'validator.rb'

class Train
  include Validator

  attr_accessor :speed, :index_current_station
  attr_reader :carriages, :route, :number

  @@instances = 0

  def self.read_file(file_path)
    File.open(file_path) do |f|
      f.each { |line| puts line }
    end
  end

  def initialize(number)
    @@instances += 1
    @number = number
    @speed = 0
    @carriages = []
    validate_number(number)
    write_train('trains.txt', self)
  rescue Exception => e 
    write_error('errors.log', e)
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

  def next_station
    index_current_station + 1
  end

  def previous_station
    index_current_station - 1
  end

  def add_carriage(carriage)
    carriages << carriage
  end

  def delete_carriage(carriage)
    carriages.delete(carriage)
  end

  def carriages_train
    carriages.each { |carriage| yield carriage }
  end

  private

  def move(index_station)
    route.stations[index_current_station].send_train(self)
    self.index_current_station = index_station
    route.stations[index_current_station].add_train(self)
  end

  def write_train(file_path, data)
    File.open(file_path, 'a') do |f|
      f.puts "#{@@instances}. Train #{data.number}"
    end
  end
end
