require 'rails_helper'

RSpec.describe 'Location API' do
  it 'returns lat and long of a particular city', :vcr do
    parsed_json = LocationService.get_lat_long('Denver, CO')

    expect(parsed_json).to be_a Hash
    expect(parsed_json[:results][0][:locations][0][:latLng][:lat]).to be_a Float
    expect(parsed_json[:results][0][:locations][0][:latLng][:lat]).to be_a Float
    expect(parsed_json[:results][0][:locations][0][:adminArea5]).to eq('Denver')
    expect(parsed_json[:results][0][:locations][0][:adminArea3]).to eq('CO')
  end
end
