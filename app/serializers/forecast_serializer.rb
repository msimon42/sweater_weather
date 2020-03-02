class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  set_id :response_id
  attributes :current_temperature,
             :current_summary,
             :current_time,
             :formatted_location,
             :today,
             :tomorrow,
             :humidity,
             :visibility,
             :uv_index,
             :hourly_forecast,
             :daily_forecast

end
