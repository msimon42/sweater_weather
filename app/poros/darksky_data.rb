class DarkskyData
  def initialize(coordinates)
    @forecast_data = DarkskyService.new.weather_data_by_location(coordinates)
  end

  def current_temperature
    @current_temperature ||= @forecast_data['currently']['temperature']
  end

  def current_summary
    @current_summary ||= @forecast_data['currently']['summary']
  end

  def current_time
    @current_time ||= @forecast_data['currently']['time']
  end

  def today
    @today ||= @forecast_data['hourly']['summary']
  end

  def tomorrow
    @tomorrow ||= @forecast_data['daily']['data'][1]['summary']
  end

  def humidity
    @humidity ||= @forecast_data['currently']['humidity']
  end

  def visibility
    @visibility ||= @forecast_data['currently']['visibility']
  end

  def uv_index
    @uv_index ||= @forecast_data['currently']['uvIndex']
  end

  def hourly_forecast(limit)
    @hourly_forecast ||= @forecast_data['hourly']['data'].first(limit).map do |hour|
      {
        time: hour['time'],
        temperatue: hour['temperature'],
        summary: hour['summary']
      }
    end
  end

  def daily_forecast(limit)
    @daily_forecast ||= @forecast_data['daily']['data'].first(limit).map do |day|
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
