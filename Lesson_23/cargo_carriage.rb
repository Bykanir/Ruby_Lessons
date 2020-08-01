require_relative 'carriage.rb'

class CargoCarriage < Carriage

  attr_accessor :available_volume, :occupied_volume
  attr_reader :volume

  def initialize(number, volume)
    super(number)
    @volume = volume
    @available_volume = volume
    @occupied_volume = 0
  end

  def carriage_filing(volume)
    occupied_volume += volume
    available_volume -= volume
  end
end
