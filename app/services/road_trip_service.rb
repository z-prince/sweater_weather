class RoadTripService
  def self.get_url(url, from, to)
    conn = Faraday.new(url: 'http://www.mapquestapi.com/directions/v2/') do |faraday|
      faraday.params['key'] = ENV['mapquest_api_key']
      faraday.params['from'] = from
      faraday.params['to'] = to
    end

    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_route_info(from, to)
    get_url('route', from, to)
  end
end
