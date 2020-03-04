class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  set_id :class
  attributes :start_location,
             :end_location,
             :travel_time,
             :arrival_temperature,
             :arrival_weather_summary

end
