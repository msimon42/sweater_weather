class RoadTrip
  def initialize(origin, destination)
    @travel_data ||= GoogleGeocodeService.new.directions_endpoint(origin, destination)
    @geo_data ||= GoogleGeocodeService.new.geocode_endpoint(destination)
    @location_data ||= LocationData.new
    @weather_data ||= DarkskyData.new(@location_data.get_coordinates(@geo_data))
  end

  def start_location
    @start_location = @location_data.origin(@travel_data)
  end

  def end_location
    @end_location = @location_data.destination(@travel_data)
  end

  def travel_time
    @travel_time = @location_data.travel_time(@travel_data)[:text]
  end

  def arrival_temperature
    @arrival_temperature = @weather_data.current_temperature
  end

  def arrival_weather_summary
    @arrival_weather_summary = @weather_data.current_summary
  end   
end
