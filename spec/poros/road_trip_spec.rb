require 'rails_helper'

RSpec.describe RoadTrip do
  it 'Makes road trip objects from a JSON response', :vcr do
    trip_data = RoadTripService.get_route_info('Denver,CO', 'Pueblo,CO')

    trip = RoadTrip.new(trip_data)

    expect(trip).to be_a RoadTrip
    expect(trip.travel_time).to eq(trip_data[:route][:formattedTime])
    expect(trip.start_city).to eq("#{trip_data[:route][:locations][0][:adminArea5]}, #{trip_data[:route][:locations][0][:adminArea3]}")
    expect(trip.end_city).to eq("#{trip_data[:route][:locations][1][:adminArea5]}, #{trip_data[:route][:locations][1][:adminArea3]}")
  end
end
