require_relative 'carriage.rb'

class PassengerCarriage < Carriage

  attr_accessor :free_seats, :occupied_seats
  attr_reader :seats

  def initialize(number, seats)
    super(number)
    @seats = seats
    @free_seats = seats
    @occupied_seats = 0
  end

  def took_seat
    occupied_seats += 1
    free_seats - 1
  end
end
