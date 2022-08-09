class RoadTrip
  attr_reader :travel_time,
              :start_city,
              :end_city

  def initialize(trip_data)
    @travel_time = trip_data[:route][:formattedTime]
    @start_city = "#{trip_data[:route][:locations][0][:adminArea5]}, #{trip_data[:route][:locations][0][:adminArea3]}"
    @end_city = "#{trip_data[:route][:locations][1][:adminArea5]}, #{trip_data[:route][:locations][1][:adminArea3]}"
  end
end
