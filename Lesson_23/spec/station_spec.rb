RSpec.describe Station do
  let!(:station) { Station.new('VD') }
  let!(:train) { Train.new('1') }

  before { station.add_train(train) }

  describe '#name' do
    it 'returns the name of the station' do
      expect(station.name).to eq 'VD'
    end
  end

  describe '#add_train' do
    it 'adding train to list trains' do
      expect(station.trains.count).to eq 1
      expect(station.trains.include?(train)).to eq true
    end
  end

  describe '#send_train' do
    it 'delete train to list station' do
      station.send_train(train)

      expect(station.trains.count).to eq 0
      expect(station.trains.include?(train)).to eq false
    end
  end
end