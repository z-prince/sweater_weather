class RestaurantSerializer
  def self.format_restaurant(forecast, restaurant)
    {
      data: {
        id: 'null',
        type: 'munchie',
        attributes: {
          destination_city: "#{restaurant.city}, #{restaurant.state}",
          forecast: {
            summary: forecast.current_weather[:weather][0][:description],
            temperature: forecast.current_weather[:temp]
          },
          restaurant: {
            name: restaurant.name,
            address: restaurant.address
          }
        }
      }
    }
  end
end
