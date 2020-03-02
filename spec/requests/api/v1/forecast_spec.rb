require 'rails_helper'

RSpec.describe 'forecast endpoint' do
  describe 'can get forecast data based on loaction', :vcr do
    it 'show' do
      get '/api/v1/forecast?location=denver,co'

      expect(response).to be_successful
      data = JSON.parse(response.body)['data']

      expect(data['attributes']['current_temperature']).to eq(28.89)
      expect(data['attributes']['current_summary']).to eq('Light Snow')
      expect(data['attributes']['current_time']).to eq(1583120908)
      expect(data['attributes']['formatted_location']).to eq('Denver, CO, USA')
      expect(data['attributes']['humidity']).to eq(0.93)
      expect(data['attributes']['visibility']).to eq(4.262)
      expect(data['attributes']['uv_index']).to eq(0)
      expect(data['attributes']['today']).to eq('Possible light snow this evening.')
      expect(data['attributes']['tomorrow']).to eq('Clear throughout the day.')

      expect(data['attributes']['hourly_forecast'].length).to eq(8)
      expect(data['attributes']['daily_forecast'].length).to eq(5)
    end
  end
end
