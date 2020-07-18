# frozen_string_literal: true

require_relative 'validator.rb'

class Carriage
  include Validator

  attr_reader :number

  @@instances = 0

  def self.read_file(file_path)
    File.open(file_path) do |f|
      f.each { |line| puts line }
    end
  end

  def initialize(number)
    @@instances += 1
    @number = number
    validate_number(number)
    write_carriage('carriages.txt', self)
  rescue Exception => e 
    write_error('errors.log', e)
  end

  private 

  def write_carriage(file_path, data)
    File.open(file_path, 'a') do |f|
      f.puts "#{@@instances}. Carriage #{data.number}"
    end
  end
end
