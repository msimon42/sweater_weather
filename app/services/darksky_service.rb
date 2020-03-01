class DarkskyService
  def weather_data_by_location(coordinates)
    params = {exclude: 'minutely'}
    uri = "forecast/#{ENV['DARK_SKY_KEY']}/#{coordinates}"
    json_parse(params, uri)
  end

  private
    def connection
      Faraday.new('https://api.darksky.net') do |f|
        f.adapter Faraday.default_adapter
      end
    end

    def json_parse(params, uri)
      response = connection.get(uri) do |request|
        request.params = params
      end
      JSON.parse(response.body)
    end
end
