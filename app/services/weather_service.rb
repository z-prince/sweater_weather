class WeatherService
  def self.get_url(url, lat, lon)
    conn = Faraday.new(url: 'https://api.openweathermap.org/data/3.0/') do |faraday|
      faraday.params['appid'] = ENV['weather_api_key']
      faraday.params['lat'] = lat
      faraday.params['lon'] = lon
      faraday.params['exclude'] = 'minutely,alerts'
      faraday.params['units'] = 'imperial'
    end

    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_weather(lat, lon)
    get_url('onecall', lat, lon)
  end
end
