require 'rails_helper'

feature GoogleGeocodeService do
  feature 'methods' do
    feature 'geocode_endpoint' do
      scenario 'returns a set of coordinates based on a geographic location', :vcr do
        city_1 = 'Denver,CO'
        city_2 = 'Chicago,IL'
        city_3 = 'San Francisco,CA'

        denver_coordinates = LocationData.new.get_coordinates(GoogleGeocodeService.new.geocode_endpoint(city_1))
        chicago_coordinates = LocationData.new.get_coordinates(GoogleGeocodeService.new.geocode_endpoint(city_2))
        san_francisco_coordinates = LocationData.new.get_coordinates(GoogleGeocodeService.new.geocode_endpoint(city_3))

        expect(denver_coordinates).to eq('39.7392358,-104.990251')
        expect(chicago_coordinates).to eq('41.8781136,-87.6297982')
        expect(san_francisco_coordinates).to eq('37.7749295,-122.4194155')
      end
    end

    feature 'travel_time' do
      scenario 'returns travel time between two locations', :vcr do
        origin = 'denver,co'
        destination = 'pueblo,co'

        duration = LocationData.new.travel_time(GoogleGeocodeService.new.directions_endpoint(origin, destination))
        expect(duration).to eq({text: '1 hour 48 mins', value: 6455})
      end
    end
  end
end
