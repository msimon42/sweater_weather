class GoogleGeocodeService
  def get_coordinates(location)
    params = {address: location, key: ENV['GOOGLE_KEY']}
    endpoint = 'maps/api/geocode/json'
    response = json_parse(endpoint, params)
    coordinates = response['results'][0]['geometry']['location']
    location = response['results'][0]['formatted_address']
    {coordinates: "#{coordinates['lat']},#{coordinates['lng']}", location: location}
  end

  def travel_time(origin, destination)
    params = {origin: origin, destination: destination, key: ENV['GOOGLE_KEY']}
    endpoint = 'maps/api/directions/json'
    response = json_parse(endpoint, params)
    {text: response['routes'][0]['legs'][0]['duration']['text'], value: response['routes'][0]['legs'][0]['duration']['value']}
  end

  private
    def connection
      Faraday.new('https://maps.googleapis.com') do |f|
        f.adapter Faraday.default_adapter
      end
    end

    def json_parse(endpoint, params)
      response = connection.get(endpoint) do |request|
        request.params = params
      end
      JSON.parse(response.body)
    end
end
