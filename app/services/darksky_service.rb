class DarkskyService


  private
    def connection
      Faraday.new('https://api.darksky.net/forecast') do |f|
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
