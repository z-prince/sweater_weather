require 'rails_helper'

RSpec.describe 'Road Trip API' do
  it 'returns travel time between two cities', :vcr do
    parsed_json = RoadTripService.get_route_info('Denver,CO', 'Pueblo,CO')

    expect(parsed_json).to be_a Hash
    expect(parsed_json[:route][:formattedTime]).to be_a String
    expect(parsed_json[:route][:locations][0][:adminArea5]).to eq('Denver')
    expect(parsed_json[:route][:locations][0][:adminArea3]).to eq('CO')
    expect(parsed_json[:route][:locations][1][:adminArea5]).to eq('Pueblo')
    expect(parsed_json[:route][:locations][1][:adminArea3]).to eq('CO')
  end
end
