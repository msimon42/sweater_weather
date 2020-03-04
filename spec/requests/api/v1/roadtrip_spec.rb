require 'rails_helper'

RSpec.describe 'roadtrip endpoint' do
  describe 'returns travel and weather data' do
    before :each do
      @user = create :user
    end
    it 'works', :vcr do
      post "/api/v1/road_trip", params: {
        origin: 'denver,co',
        destination: 'pueblo,co',
        api_key: @user.api_key
      }

      expect(response).to be_successful
      data = JSON.parse(response.body)['data']
      expect(data['attributes']['start_location']).to eq('Denver, CO, USA')
      expect(data['attributes']['end_location']).to eq('Pueblo, CO, USA')
      expect(data['attributes']['travel_time']).to eq('1 hour 48 mins')
      expect(data['attributes']['arrival_weather_summary']).to eq('Clear')
      expect(data['attributes']['arrival_temperature']).to eq(41.3)
    end
  end
end
