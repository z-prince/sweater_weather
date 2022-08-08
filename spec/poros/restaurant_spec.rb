require 'rails_helper'

RSpec.describe Forecast do
  it 'makes restaurantation objects from JSON response' do
    response_file = File.read('./spec/data/restaurant_response.json')
    restaurant_data = JSON.parse(response_file, symbolize_names: true)
    restaurant = Restaurant.new(restaurant_data)

    expect(restaurant).to be_a Restaurant
    expect(restaurant.name).to eq(restaurant_data[:businesses][0][:name])
    expect(restaurant.address).to eq(restaurant_data[:businesses][0][:location][:display_address])
  end
end
