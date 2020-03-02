require 'rails_helper'

feature DarkskyService do
  feature 'methods' do
    feature 'weather_data_by_location' do
      scenario 'returns current weather data based on coordinates', :vcr do
        response = DarkskyService.new.weather_data_by_location('39.7392358,-104.990251')

        expect(response['currently']['temperature']).to eq(36.23)
        expect(response['currently']['summary']).to eq('Clear')
        expect(response['currently']['time']).to eq(1583171619)
        expect(response['currently']['apparentTemperature']).to eq(36.01)
        expect(response['currently']['humidity']).to eq(0.7)
        expect(response['currently']['visibility']).to eq(10)
        expect(response['currently']['uvIndex']).to eq(4)
      end

      scenario 'returns hourly and daily forecast', :vcr do
        response = DarkskyService.new.weather_data_by_location('41.8781136,-87.6297982')

        expect(response['hourly']['summary']).to eq('Partly cloudy throughout the day.')
        expect(response['hourly']['data'].length).to eq(49)
        expect(response['daily']['summary']).to eq('Light rain next Monday.')
        expect(response['daily']['data'].length).to eq(8)
      end
    end
  end
end
