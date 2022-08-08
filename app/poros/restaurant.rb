class Restaurant
  attr_reader :name,
              :address,
              :city,
              :state

  def initialize(restaurant_data)
    @name = restaurant_data[:businesses][0][:name]
    @address = restaurant_data[:businesses][0][:location][:display_address].join
    @city = restaurant_data[:businesses][0][:location][:city]
    @state = restaurant_data[:businesses][0][:location][:state]
  end
end
