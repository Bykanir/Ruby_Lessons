require_relative 'validator.rb'

class Carriage
  include Validator
  
  attr_reader :number

  def initialize(number)
    @number = number
    validate_number(number)
  end
end
