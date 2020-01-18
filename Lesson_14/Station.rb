class Station

  attr_reader :trains, :name     # геттер списка поездов

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)     # добавление поездов на станцию
    trains << train
  end

  def send_train(train)     # отправление поездов
    trains.delete(train)
  end
end
