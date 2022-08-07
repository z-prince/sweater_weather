class Location
  attr_reader :lat,
              :lng

  def initialize(loc_data)
    @lat = loc_data[:results][0][:locations][0][:latLng][:lat]
    @lng = loc_data[:results][0][:locations][0][:latLng][:lng]
  end
end
