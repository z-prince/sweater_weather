class RoadTripSerializer
  def self.format_road_trip(trip_data, forecast_data)
    {
      data: {
        id: 'null',
        type: 'roadtrip',
        attributes: {
          start_city: trip_data.start_city,
          end_city: trip_data.end_city,
          travel_time: trip_data.travel_time,
          weather_at_eta: {
            temperature: forecast_data.temperature,
            conditions: forecast_data.conditions
          }
        }
      }
    }
  end
end
