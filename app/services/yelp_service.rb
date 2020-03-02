class YelpService
  def find_restaurant(destination, type, time)
    params = {term: type, location: destination, limit: 1, open_at: time}
    endpoint = 'v3/businesses/search'
    response = json_parse(endpoint, params)
    response['businesses'][0]['name']
  end

  private
    def connection
      Faraday.new('https://api.yelp.com') do |f|
        f.adapter Faraday.default_adapter
      end
    end

    def json_parse(endpoint, params)
      response = connection.get(endpoint) do |request|
        request.headers['Authorization'] = ENV['YELP_KEY']
        request.params = params
      end
      JSON.parse(response.body)
    end
end
