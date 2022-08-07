class ForecastFacade
  def self.create_forecast(city)
    loc = Location.new(LocationService.get_lat_long(city))
    weather_data = WeatherService.get_weather(loc.lat, loc.lng)
    Forecast.new(weather_data)
  end
end
