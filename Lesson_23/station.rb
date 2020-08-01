require_relative 'validator.rb'

class Station
  include Validator::Station

  attr_reader :trains, :name

  @@instances = 0

  def self.read_file
    File.open('station.txt') do |f|
      f.each { |line| puts line }
    end
  end

  def initialize(name)
    @@instances += 1
    @name = name
    @trains = []
    validate(name)
    write_station
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

  def write_station
    File.open('station.txt', 'a') do |f|
      f.puts "#{@@instances}. Station #{self.name}"
    end
  end
end