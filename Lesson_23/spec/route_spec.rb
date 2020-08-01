RSpec.describe Route do
  let!(:station_1) { Station.new('Volgo') }
  let!(:station_2) { Station.new('Donsk') }
  let!(:station_3) { Station.new('Rostov') }
  let!(:route) { Route.new(station_1, station_2) }

  before { route.add_station(station_3)}

  describe '#first_station' do
    it 'returns the first statiom in the route' do
      expect(route.first_station).to eq station_1
    end
  end

  describe '#last_station' do
    it 'returns the last statiom in the route' do
      expect(route.last_station).to eq station_2
    end
  end

  describe '#name' do
    it 'returns the name route' do
      expect(route.name).to eq "#{station_1.name} - #{station_2.name}"
    end
  end

  describe '#add_station' do
    it 'adding station to list stations' do
      expect(route.stations.count).to eq 3
      expect(route.stations.include?(station_3)).to eq true
    end
  end

  describe '#delete_station' do
    it 'delete station to list stations' do
      route.delete_station(station_3)

      expect(route.stations.count).to eq 2
      expect(route.stations.include?(station_3)).to eq false
    end
  end
end  