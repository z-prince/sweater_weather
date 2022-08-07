require 'rails_helper'

RSpec.describe 'Weather API' do
  it 'returns weather of a particular city', :vcr do
    # "lat": 39.738453,
    # "lng": -104.984853
    parsed_json = WeatherService.get_weather('39.738453', '-104.984853')

    expect(parsed_json).to be_a Hash
    expect(parsed_json[:minutely]).to eq(nil)
    expect(parsed_json[:alerts]).to eq(nil)
    expect(parsed_json[:daily].count).to eq(8)
    expect(parsed_json[:hourly].count).to eq(48)
  end
end
