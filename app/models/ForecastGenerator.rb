class ForecastGenerator
  attr_reader :city
  def initialize(location)
    @location_data = GoogleGeocodeService.new.geocode_endpoint(location)
    coordinates = LocationData.new.get_coordinates(@location_data)
    @city = LocationData.new.get_location(@location_data)
    @data = DarkskyData.new(coordinates)
  end

  def current_weather
    @current_weather ||= {
      current_temperature: @data.current_temperature,
      current_summary: @data.current_summary,
      timestamp: @data.current_time,
      today: @data.today,
      tomorrow: @data.tomorrow,
      humidity: @data.humidity,
      visibility: @data.visibility,
      uv_index: @data.uv_index
    }
  end

  def hourly_forecast
    @hourly_forecast ||= @data.hourly_forecast(8)
  end

  def daily_forecast
    @daily_forecast ||= @data.daily_forecast(5)
  end
end
