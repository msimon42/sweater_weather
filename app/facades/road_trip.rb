class RoadTrip
  def initialize(origin, destination, food)
    @travel_data ||= GoogleGeocodeService.new.directions_endpoint(origin, destination)
    @coordinates ||= GoogleGeocodeService.new.geocode_endpoint(destination)
    @weather_data ||= DarkskyService.new.weather_data_by_location("#{@coordinates[:coordinates]},#{Time.now.to_i + travel_time[:value]}")
    @location_data ||= LocationData.new
  end

  def start_location
    @start_location = @location_data.origin(@travel_data)
  end

  def end_location
    @end_location = @location_data.destination(@travel_data)
  end

  def travel_time
    @travel_time = @location_data.travel_time[:text]
  end

  def forecast
    @forecast = @weather_data['currently']['summary']
  end
end
