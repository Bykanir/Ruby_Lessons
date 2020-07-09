# frozen_string_literal: true

class PassengerCarriage < Carriage
  def initialize(number, seats)
    super(number)
    @seats = seats
  end
end
