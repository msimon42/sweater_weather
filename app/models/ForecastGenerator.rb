class ForecastGenerator

  def initialize(location)
    @coordinates = GoogleGeocodeService.new.get_coordinates(location)
    @data = DarkskyService.new.weather_data_by_location(@coordinates)
  end

  def current_time
    
  end

end
