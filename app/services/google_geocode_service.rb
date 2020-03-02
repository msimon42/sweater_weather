class GoogleGeocodeService
  def get_coordinates(location)
    params = {address: location, key: ENV['GOOGLE_KEY']}
    response = json_parse(params)
    coordinates = response['results'][0]['geometry']['location']
    location = response['results'][0]['formatted_address']
    {coordinates: "#{coordinates['lat']},#{coordinates['lng']}", location: location}
  end

  private
    def connection
      Faraday.new('https://maps.googleapis.com/maps/api/geocode/json') do |f|
        f.adapter Faraday.default_adapter
      end
    end

    def json_parse(params)
      response = connection.get do |request|
        request.params = params
      end
      JSON.parse(response.body)
    end
end
