class Location
  attr_reader :lat,
              :long

  def initialize(loc_data)
    @lat = loc_data[:results][0][:locations][0][:latLng][:lat]
    @long = loc_data[:results][0][:locations][0][:latLng][:long]
  end
end
