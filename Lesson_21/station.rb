# frozen_string_literal: true

require_relative 'validator.rb'

class Station
  include Validator

  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
    validate_name(name)
  end

  def add_train(train)
    trains << train
  end

  def send_train(train)
    trains.delete(train)
  end

  def trains_in_station
    trains.each { |train| yield train }
  end
end
