RSpec.describe Query do
  let!(:query) { Query.new('https://habr.com/ru/') }

  describe '#response' do
  	it 'return HTTP object' do
  	  expect(query.response.class).to eq Net::HTTPOK
  	end
  end

  describe '#code_response' do
  	it 'get response code' do
  	  expect(query.code_response).to eq '200'
  	end
  end

  describe '#body_response' do
  	it 'get response body' do
  	  expect(query.body_response.empty?).to eq false
  	end
  end

  describe '#headers_response' do
  	it 'get response headers' do
  	  expect(query.headers_response.class).to eq Hash
  	end
  end
end