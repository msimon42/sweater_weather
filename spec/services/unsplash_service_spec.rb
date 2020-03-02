require 'rails_helper'

RSpec.describe UnsplashService do
  feature 'image_by_location', :vcr do
    scenario 'returns image based in location' do
      image = UnsplashService.new.image_by_location('denver,co')

      expect(image).to eq("https://images.unsplash.com/photo-1568566571359-b20545928521?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjExODM4M30")
    end
  end
end
