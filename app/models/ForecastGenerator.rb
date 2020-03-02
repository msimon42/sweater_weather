class ForecastGenerator

  def initialize(location)
    @location_data = GoogleGeocodeService.new.get_coordinates(location)
    @temp_data = DarkskyService.new.weather_data_by_location(@location_data[:coordinates])
  end

  def current_temperature
    @current_temperature ||= @temp_data['currently']['temperature']
  end

  def current_summary
    @current_summary ||= @temp_data['currently']['summary']
  end

  def formatted_location
    @formatted_location ||= @location_data[:location]
  end

  def today
    @today ||= @temp_data['hourly']['summary']
  end

  def tomorrow
    @tomorrow ||= @temp_data['daily']['data'][0]['summary']

  def humidity
    @humidity ||= @temp_data['currently']['humidity']
  end

  def visibility
    @visibility ||= @temp_data['currently']['visibility']
  end

  def uv_index
    @uv_index ||= @temp_data['currently']['uvIndex']
  end

  def hourly_forecast
    @hourly_forecast ||= @temp_data['hourly']['data'].first(8).map do |hour|
      {
        time: hour['time'],
        temperatue: hour['temperature'],
        summary: hour['summary']
      }
    end
  end

  def daily_forecast
    @daily_forecast ||= @temp_data['daily']['data'].first(5).map do |day|
      {
        time: day['time'],
        precipitation: day['precipProbability'],
        high: day['temperatureHigh'],
        low: day['temperatureLow'],
        summary: day['summary']
      }
    end
  end
end
end
