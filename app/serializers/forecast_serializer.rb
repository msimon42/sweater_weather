class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  set_id :city
  attributes :current_weather,
             :hourly_forecast,
             :daily_forecast

end
