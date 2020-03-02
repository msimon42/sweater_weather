class UnsplashService
  def image_by_location(location)
    endpoint = 'search/photos'
    params = {query: location, client_id: ENV['UNSPLASH_KEY']}

    response = json_parse(endpoint, params)
    response['results'][0]['urls']['full']
  end

  private
    def connection
      Faraday.new('https://api.unsplash.com') do |f|
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
