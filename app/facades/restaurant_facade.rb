class RestaurantFacade
  def self.create_restaurant(city, category)
    restaurant_data = RestaurantService.get_restaurant(city, category)
    Restaurant.new(restaurant_data)
  end
end
