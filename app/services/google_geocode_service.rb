class GoogleGeocodeService
  def geocode_endpoint(location)
    params = {address: location, key: ENV['GOOGLE_KEY']}
    endpoint = 'maps/api/geocode/json'
    response = json_parse(endpoint, params)
  end

  def directions_endpoint(origin, destination)
    params = {origin: origin, destination: destination, key: ENV['GOOGLE_KEY']}
    endpoint = 'maps/api/directions/json'
    response = json_parse(endpoint, params)
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
