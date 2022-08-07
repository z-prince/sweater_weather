require 'rails_helper'

RSpec.describe 'The location API', :vcr do
  it 'Returns the forecast for a specific city' do
    get '/api/v1/forecast?location=denver,co'

    response_body = JSON.parse(response.body, symbolize_names: true)

    forecast = response_body[:data]

    current_forecast = forecast[:attributes][:current_weather]
    daily_forecast = forecast[:attributes][:daily_weather]
    hourly_forecast = forecast[:attributes][:hourly_weather]

    expect(response).to be_successful
    expect(forecast[:id]).to eq(nil)
    expect(forecast[:type]).to eq('forecast')

    ##### Current weather expectations #####

    expect(current_forecast.keys).to eq(%i[datetime sunrise
                                           sunset temperature
                                           feels_like humidity
                                           uvi visibility
                                           conditions icon])

    ##### Daily weather expectations #####

    expect(daily_forecast.count).to eq(5)

    daily_forecast.each do |daily|
      expect(daily.keys).to eq(%i[date sunrise sunset max_temp min_temp conditions icon])
    end
    ##### Hourly weather expectations #####

    expect(hourly_forecast.count).to eq(8)

    hourly_forecast.each do |hourly|
      expect(hourly.keys).to eq(%i[time temperature conditions icon])
    end
  end
end
