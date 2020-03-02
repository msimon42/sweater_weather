require 'rails_helper'

RSpec.describe ForecastGenerator do
  describe 'instance methods', :vcr do
    before :each do
      @forecast = ForecastGenerator.new('Denver,CO')
    end

    it 'current_temperature' do
      expect(@forecast.current_temperature).to eq(34.26)
    end

    it 'current_summary' do
      expect(@forecast.current_summary).to eq('Flurries')
    end

    it 'formatted_location' do
      expect(@forecast.formatted_location).to eq('Denver, CO, USA')
    end

    it 'today' do
      expect(@forecast.today).to eq('Foggy later this evening and tonight.')
    end

    it 'tomorrow' do
      expect(@forecast.tomorrow).to eq('Clear throughout the day.')
    end

    it 'humidity' do
      expect(@forecast.humidity).to eq(0.82)
    end

    it 'visibility' do
      expect(@forecast.visibility).to eq(5.478)
    end

    it 'uv_index' do
      expect(@forecast.uv_index).to eq(0)
    end

    it 'hourly_forecast' do
      expect(@forecast.hourly_forecast.length).to eq(8)
    end

    it 'daily_forecast' do
      expect(@forecast.daily_forecast.length).to eq(5)
    end
  end
end
