class RestaurantService
  def self.get_url(url, location, cats)
    conn = Faraday.new(url: 'https://api.yelp.com/v3/') do |faraday|
      faraday.headers['Authorization'] = ENV['yelp_api_key']
      faraday.params['location'] = location
      faraday.params['categories'] = cats
    end

    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_restaurant(location, cats)
    get_url('businesses/search', location, cats)
  end
end
