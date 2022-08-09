class RoadTripFacade
  def self.create_roadtrip(from, to)
    trip_data = RoadTripService.get_route_info(from, to)
    RoadTrip.new(trip_data)
  end
end
