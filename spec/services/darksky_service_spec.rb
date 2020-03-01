require 'rails_helper'

feature DarkskyService do
  feature 'methods' do
    feature 'weather_data_by_location' do
      scenario 'returns current weather data based on coordinates', :vcr do
        response = DarkskyService.new.weather_data_by_location('39.7392358,-104.990251')

        expect(response['currently']['temperature']).to eq(44.54)
        expect(response['currently']['summary']).to eq('Overcast')
        expect(response['currently']['time']).to eq(1583041124)
        expect(response['currently']['apparentTemperature']).to eq(43.8)
        expect(response['currently']['humidity']).to eq(0.29)
        expect(response['currently']['visibility']).to eq(10)
        expect(response['currently']['uvIndex']).to eq(0)
      end

      scenario 'returns hourly and daily forecast', :vcr do
        response = DarkskyService.new.weather_data_by_location('41.8781136,-87.6297982')

        expect(response['hourly']['summary']).to eq('Mostly cloudy throughout the day.')
        expect(response['hourly']['data'].length).to eq(49)
        expect(response['daily']['summary']).to eq('No precipitation throughout the week.')
        expect(response['daily']['data'].length).to eq(8)
      end
    end
  end
end
