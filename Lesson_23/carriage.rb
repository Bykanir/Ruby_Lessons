require_relative 'validator.rb'

class Carriage
  include Validator::Train

  attr_reader :number

  @@instances = 0

  def self.read_file
    File.open('carriage.txt') do |f|
      f.each { |line| puts line }
    end
  end
  
  def initialize(number)
  	@@instances += 1
    @number = number
    validate(number)
    write_carriage
  end

  private

  def write_carriage
    File.open('carriage.txt', 'a') do |f|
      f.puts "#{@@instances}. Carriage #{self.number}"
    end
  end
end