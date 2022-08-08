class Restaurant
  attr_reader :name,
              :address

  def initialize(restaurant_data)
    @name = restaurant_data[:businesses][0][:name]
    @address = restaurant_data[:businesses][0][:location][:display_address]
  end
end
