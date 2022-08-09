class ForecastFacade
  def self.create_forecast(city)
    loc = Location.new(LocationService.get_lat_long(city))
    weather_data = WeatherService.get_weather(loc.lat, loc.lng)
    Forecast.new(weather_data)
  end

  def self.create_current_forecast(road_trip)
    loc = Location.new(LocationService.get_lat_long(road_trip.end_city))
    weather_data = WeatherService.get_weather(loc.lat, loc.lng)
    forecast = Forecast.new(weather_data)

    CurrentWeather.new(forecast, road_trip)
  end
end
