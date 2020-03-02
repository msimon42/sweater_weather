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

        expect(denver_coordinates).to eq({coordinates: '39.7392358,-104.990251', location: 'Denver, CO, USA'})
        expect(chicago_coordinates).to eq({coordinates:'41.8781136,-87.6297982', location: 'Chicago, IL, USA'})
        expect(san_francisco_coordinates).to eq({coordinates:'37.7749295,-122.4194155', location: 'San Francisco, CA, USA'})
      end
    end

    feature 'travel_time' do
      scenario 'returns travel time between two locations', :vcr do
        origin = 'denver,co'
        destination = 'pueblo,co'

        duration = GoogleGeocodeService.new.travel_time(origin, destination)
        expect(duration).to eq('1 hour 48 mins')
      end
    end
  end
end
