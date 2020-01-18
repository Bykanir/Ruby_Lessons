load 'Carriage.rb'

class CargoCarriage < Carriage

  def initialize(number, volume)
    super(number)
    @volume = volume
  end
end
