require 'rails_helper'

RSpec.describe 'munchie endpoint' do
  describe 'returns travel and restaurant data' do
    it 'works' do
      get "/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese"

      expect(response).to be_successful
      data = JSON.parse(respnse.body)['data']

      expect(data['attributes']]'end_location').to eq('Pueblo, CO, USA')
      expect(data['attributes']['travel_time']).to eq('1 hour, 48 mins')
      #VCR is having issues with this test; test will probably fail due to changing weather.
      expect(data['attributes']['forecast']).to eq('Clear')
      expect(data['attributes']['restaurant']).to eq({name: "Kan's Kitchen", address: "1620 S Prairie AvePueblo, CO 81005"})
    end
  end
end
