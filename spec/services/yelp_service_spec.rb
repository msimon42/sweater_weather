require 'rails_helper'

feature YelpService do
  feature 'methods' do
    feature 'find_restaurant' do
      scenario 'returns a restaurant name', :vcr do
        location = 'pueblo,co'
        type = 'chinese'
        time = 2.hours.from_now.to_i

        response = YelpService.new.find_restaurant(location, type, time)
        expect(response).to eq("Kan's Kitchen")
      end
    end
  end
end
