require_relative 'validator.rb'

class Station
  include Validator
  
  attr_reader :trains, :name     # геттер списка поездов

  def initialize(name)
    @name = name
    @trains = []
    name_valid?(name)
  end

  def add_train(train)     # добавление поездов на станцию
    trains << train
  end

  def send_train(train)     # отправление поездов
    trains.delete(train)
  end
end
