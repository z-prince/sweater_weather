require 'rails_helper'

RSpec.describe 'The restaurant API', :vcr do
  it 'Returns the restaurant for a specific city and category', :vcr do
    get '/api/v1/munchies?location=denver,co&food=chinese'

    response_body = JSON.parse(response.body, symbolize_names: true)

    restaurant_data = response_body[:data]

    forecast = restaurant_data[:attributes][:forecast]
    restaurant = restaurant_data[:attributes][:restaurant]

    expect(response).to be_successful
    expect(restaurant_data[:id]).to eq('null')
    expect(restaurant_data[:type]).to eq('munchie')
    expect(restaurant_data[:attributes].keys).to eq(%i[destination_city forecast restaurant])

    ##### Forecast expectations #####

    expect(restaurant_data[:attributes][:forecast].keys).to eq(%i[summary temperature])
    ##### Restaurant expectations #####

    expect(restaurant_data[:attributes][:restaurant].keys).to eq(%i[name address])
  end
end
