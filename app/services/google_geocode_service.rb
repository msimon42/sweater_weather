class GoogleGeocodeService
  def get_coordinates(location)
    params = {location: location, key: ENV['GOOGLE_KEY']}
    json_parse(params)
  end

  private
    def connection
      Faraday.new('https://maps.googleapis.com/maps/api/geocode/json') do |f|
        f.default_adapter Faraday.default_adapter
      end
    end

    def json_parse(params)
      response = connection.get do |request|
        request.params = params
      end
      JSON.parse(response.body)
    end
end
