require_relative 'train.rb'

class CargoTrain < Train
  def add_carriage(carriage)
    super if carriage.is_a?(CargoCarriage)
  end
end 