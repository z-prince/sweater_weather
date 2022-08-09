require 'rails_helper'

RSpec.describe 'Road Trip API' do
  it 'returns travel time between two cities', :vcr do
    parsed_json = RoadTripService.get_route_info('Denver,CO', 'Pueblo,CO')

    expect(parsed_json).to be_a Hash
    expect(parsed_json[:route][:formattedTime]).to be_a String
  end
end
