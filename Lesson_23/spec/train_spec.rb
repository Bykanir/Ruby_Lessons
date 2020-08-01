RSpec.describe Train do
  let!(:train) { Train.new('1') }
  let!(:station_1) { Station.new('Volgo') }
  let!(:station_2) { Station.new('Donsk') }
  let!(:route) { Route.new(station_1, station_2) }
  let!(:carriage) { Carriage.new('1') }

  before { train.accept_route(route) }
  before { train.add_carriage(carriage) }

  describe '#number' do
    it 'returns the number of the train' do
      expect(train.number).to eq '1'
    end
  end

  describe '#accept_route' do
    it 'returns the route of the train' do
      expect(train.route).to eq route
    end
  end

  describe '#move_forward' do
    it 'transition train from one station to another' do
      train.move_forward
      expect(station_1.trains.include?(train)).to eq false
      expect(station_2.trains.include?(train)).to eq true
    end
  end

  describe '#move_backward' do
    it 'transition train from one station to another' do
      train.move_backward
      expect(station_1.trains.include?(train)).to eq false
      expect(station_2.trains.include?(train)).to eq true
    end
  end

  describe '#move_backward' do
    it 'transition train from one station to another' do
      train.move_backward
      expect(station_1.trains.include?(train)).to eq false
      expect(station_2.trains.include?(train)).to eq true
    end
  end

  describe '#add_carriage' do
    it 'adding carriage to list carriages' do
      expect(train.carriages.count).to eq 1
      expect(train.carriages.include?(carriage)).to eq true
    end
  end

  describe '#delete_carriage' do
    it 'adding carriage to list carriages' do
      train.delete_carriage(carriage)

      expect(train.carriages.count).to eq 0
      expect(train.carriages.include?(carriage)).to eq false
    end
  end
end