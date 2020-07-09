# frozen_string_literal: true

require_relative 'validator.rb'

class Train
  include Validator

  attr_accessor :speed, :index_current_station
  attr_reader :carriages, :route, :number

  def initialize(number)
    @number = number
    @speed = 0
    @carriages = []
    validate_number(number)
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

  private

  def move(index_station)
    route.stations[index_current_station].send_train(self)
    self.index_current_station = index_station
    route.stations[index_current_station].add_train(self)
  end
end
