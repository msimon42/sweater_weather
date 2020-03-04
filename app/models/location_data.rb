class LocationData
  def get_coordinates(json_data)
    "#{json_data['results'][0]['geometry']['location']['lat']},#{json_data['results'][0]['geometry']['location']['lng']}"
  end

  def get_location(json_data)
    json_data['results'][0]['formatted_address']
  end

  def travel_time(json_data)
    {text: json_data['routes'][0]['legs'][0]['duration']['text'], value: json_data['routes'][0]['legs'][0]['duration']['value']}
  end

  def origin(json_data)
    json_data['routes'][0]['legs'][0]['start_address']
  end

  def destination(json_data)
    json_data['routes'][0]['legs'][0]['end_address']
  end
end
