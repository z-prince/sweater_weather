require 'rails_helper'

RSpec.describe 'RestaurantFacade' do
  describe 'name and address call' do
    it 'returns weather, location and restaurant name', :vcr do
      results = RestaurantFacade.create_restaurant('denver,co', 'chinese') # set to variable to decrease number of api and/or cassette calls

      expect(results).to be_a Restaurant
      expect(results.name).to be_a String
      expect(results.address).to be_a String
    end
  end
end
