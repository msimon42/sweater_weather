class Munchie
  def initialize(origin, destination, food)
    @travel_data = GoogleGeocodeService.new.travel_time(origin, destination)
    @coordinates = GoogleGeocodeService.new.get_coordinates(destination)
    @weather_data = DarkskyService.new.weather_data_by_location(@coordinates[:coordinates])
    @restaurant_data = YelpService.new.find_restaurant(destination, food, (Time.now.to_i + @travel_data[:value]))
  end

  def end_location
    @end_location = @coordinates[:location]
  end

  def travel_time
    @travel_time = @travel_data[:text]
  end

  def forecast
    @forecast = @weather_data['currently']['summary']
  end

  def restaurant
    @restaurant = @restaurant_data
  end
end
