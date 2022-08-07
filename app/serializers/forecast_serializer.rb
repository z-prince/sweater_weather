class ForecastSerializer
  def self.format_weather(forecast)
    {
      data: {
        id: nil,
        type: 'forecast',
        attributes: {
          current_weather: {
            datetime: forecast.current_weather[:dt],
            sunrise: forecast.current_weather[:sunrise],
            sunset: forecast.current_weather[:sunset],
            temperature: forecast.current_weather[:temp],
            feels_like: forecast.current_weather[:feels_like],
            humidity: forecast.current_weather[:humidity],
            uvi: forecast.current_weather[:uvi],
            visibility: forecast.current_weather[:visibility],
            conditions: forecast.current_weather[:weather][0][:description],
            icon: forecast.current_weather[:weather][0][:icon]
          },
          daily_weather: forecast.daily_weather.map do |day|
            {
              date: Time.at(day[:dt]).utc.strftime('%H:%M:%S'),
              sunrise: day[:sunrise],
              sunset: day[:sunset],
              max_temp: day[:temp][:max],
              min_temp: day[:temp][:min],
              conditions: day[:weather][0][:description],
              icon: day[:weather][0][:icon]
            }
          end.take(5),
          hourly_weather: forecast.hourly_weather.map do |hour|
            {
              time: hour[:dt],
              temperature: hour[:temp],
              conditions: hour[:weather][0][:description],
              icon: hour[:weather][0][:icon]
            }
          end.take(8)
        }
      }
    }
  end
end
