# frozen_string_literal: true

require_relative 'validator.rb'

class Station
  include Validator

  attr_reader :trains, :name

  @@instances = 0

  def self.read_file(file_path)
    File.open(file_path) do |f|
      f.each { |line| puts line }
    end
  end

  def initialize(name)
    @@instances += 1
    @name = name
    @trains = []
    validate_name(name)
    write_station('stations.txt', self)
  rescue Exception => e 
    write_error('errors.log', e)
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

  private

  def write_station(file_path, data)
    File.open(file_path, 'a') do |f|
      f.puts "#{@@instances}. Station #{data.name}"
    end
  end
end
