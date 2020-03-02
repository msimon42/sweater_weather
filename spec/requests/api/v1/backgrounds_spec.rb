require 'rails_helper'

RSpec.describe 'background endpoint' do
  it 'works', :vcr do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful
    data = response.body

    expect(data).to eq("https://images.unsplash.com/photo-1568566571359-b20545928521?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjExODM4M30")
  end
end
