class CurrentWeather
  attr_reader :temperature,
              :conditions

  def initialize(forecast, road_trip)
    @data = forecast
    @travel_time = road_trip.travel_time.slice(0..1).to_i
    @temperature = if arrival_weather[:temp].is_a?(Hash)
                     arrival_weather[:temp][:max]
                   else
                     arrival_weather[:temp]
                   end
    @conditions = arrival_weather[:weather][0][:description]
  end

  def arrival_weather
    if @travel_time < 48
      @data.hourly_weather[@travel_time - 1]
    else
      @data.daily_weather[@travel_time / 24]
    end
  end
end
