require_relative 'requireable.rb'

class Carriage
  include Company
  include InstanceCounter::InstanceMethods
  extend InstanceCounter::ClassMethods

  attr_reader :number

  def initialize(number)
    @number = number
    register_instance
    Carriage.increase_instances(@@instances)
  end
end
