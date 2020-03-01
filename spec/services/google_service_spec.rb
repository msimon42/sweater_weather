require 'rails_helper'

feature GoogleGeocodeService do
  feature 'methods' do
    feature 'get_coordinates' do
      scenario 'returns a set of coordinates based on a geographic location', :vcr do
        city_1 = 'Denver,CO'
        city_2 = 'Chicago,IL'
        city_3 = 'San Francisco,CA'

        denver_coordinates = GoogleGeocodeService.new.get_coordinates(city_1)
        chicago_coordinates = GoogleGeocodeService.new.get_coordinates(city_2)
        san_francisco_coordinates = GoogleGeocodeService.new.get_coordinates(city_3)

        expect(denver_coordinates).to eq('39.7392358,-104.990251')
        expect(chicago_coordinates).to eq('41.8781136,-87.6297982')
        expect(san_francisco_coordinates).to eq('37.7749295,-122.4194155')
      end
    end
  end
end
