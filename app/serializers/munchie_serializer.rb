class MunchieSerializer
  include FastJsonapi::ObjectSerializer
  set_id :class
  attributes :end_location,
             :travel_time,
             :forecast,
             :restaurant

end
