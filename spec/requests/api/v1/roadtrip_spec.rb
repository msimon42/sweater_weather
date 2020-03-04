require 'rails_helper'

RSpec.describe 'roadtrip endpoint' do
  describe 'returns travel and weather data' do
    before :each do
      @user = create :user
    end
    it 'works' do
      post "/api/v1/road_trip", params: {
        origin: 'denver,co',
        destination: 'pueblo,co',
        api_key: @user.api_key
      }

      expect(response).to be_successful
      data = JSON.parse(response.body)['data']

      expect(data['attributes']['end_location']).to eq('Pueblo, CO, USA')
      expect(data['attributes']['travel_time']).to eq('1 hour 48 mins')
      #VCR is having issues with this test; test will probably fail due to changing weather.
      expect(data['attributes']['forecast']).to eq('Clear')
      expect(data['attributes']['restaurant']).to eq({'name' => "Kan's Kitchen", 'address' => "1620 S Prairie AvePueblo, CO 81005"})
    end
  end
end
