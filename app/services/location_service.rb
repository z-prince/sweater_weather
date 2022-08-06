class LocationService
  def self.get_url(url, keyword = nil)
    conn = Faraday.new(url: 'http://www.mapquestapi.com/geocoding/v1/') do |faraday|
      faraday.params['key'] = ENV['mapquest_api_key']
      faraday.params['location'] = keyword unless keyword.nil?
      faraday.params['outFormat'] = ['json']
    end

    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_lat_long(keyword)
    get_url('address', keyword)
  end
end
