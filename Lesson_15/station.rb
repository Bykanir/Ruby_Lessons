class Station

  attr_reader :trains, :name     # геттер списка поездов

  @@stations = []

  class << self
    def all
      @@stations
    end
  end

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
  end

  def add_train(train)     # добавление поездов на станцию
    trains << train
  end

  def send_train(train)     # отправление поездов
    trains.delete(train)
  end
end
