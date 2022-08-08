require 'rails_helper'

RSpec.describe 'Restaurant API' do
  it 'returns restaurant of a particular city and category', :vcr do
    parsed_json = RestaurantService.get_restaurant('denver,co', 'chinese')

    expect(parsed_json).to be_a Hash

    expect(parsed_json[:businesses][0][:name]).to be_a String
    expect(parsed_json[:businesses][0][:location]).to be_a Hash
    expect(parsed_json[:businesses][0][:location][:city]).to eq('Denver')
    expect(parsed_json[:businesses][0][:location][:state]).to eq('CO')
    expect(parsed_json[:businesses][0][:location][:display_address]).to eq(['2817 E 3rd Ave', 'Denver, CO 80206'])
    expect(parsed_json[:businesses][0][:categories]).to be_a Array
  end
end
