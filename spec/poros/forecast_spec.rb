require 'rails_helper'

RSpec.describe Forecast do
  it 'makes weatheration objects from JSON response' do
    response_file = File.read('./spec/data/weather_response.json')
    weather_data = JSON.parse(response_file, symbolize_names: true)
    weather = Forecast.new(weather_data)

    expect(weather).to be_a Forecast
    expect(weather.current_weather).to eq(weather_data[:current])
    expect(weather.daily_weather).to eq(weather_data[:daily])
    expect(weather.hourly_weather).to eq(weather_data[:hourly])
  end
end
