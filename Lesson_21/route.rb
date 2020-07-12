# frozen_string_literal: true

require_relative 'validator.rb'

class Route
  include Validator

  attr_reader :stations, :first_station, :last_station, :name

  def initialize(first_station, last_station)
    @name = "#{first_station.name} - #{last_station.name}"
    @first_station = first_station
    @last_station = last_station
    @stations = [first_station, last_station]
    validate_route(first_station, last_station)
  end

  def add_station(station)
    stations.insert(1, station)
  end

  def delete_station(station)
    stations.delete(station) if station != first_station && station != last_station
  end
end
