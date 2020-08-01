RSpec.describe Carriage do
  let!(:carriage) { Carriage.new('1') }

  describe '#number' do
    it 'returns the number of the carriage' do
      expect(carriage.number).to eq '1'
    end
  end
end