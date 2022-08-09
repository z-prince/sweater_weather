require 'rails_helper'

RSpec.describe 'Road Trip Requests' do
  describe 'create road trip' do
    it 'can create a road trip', :vcr do
      user = User.create!(email: 'floopygooberstein@aol.com', password: 'verysecret',
                          password_confirmation: 'verysecret')
      params = {
        'origin': 'Denver,CO',
        'destination': 'Pueblo,CO',
        'api_key': user.api_key.to_s
      }

      headers = {
        'Content_Type': 'application/json',
        'Accept': 'application/json'
      }

      post('/api/v1/road_trip', headers: headers, params: params.to_json)

      result = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)
      expect(result[:data][:attributes][:start_city]).to be_a String
      expect(result[:data][:attributes][:end_city]).to be_a String
      expect(result[:data][:attributes][:travel_time]).to be_a String
      expect(result[:data][:attributes][:weather_at_eta][:temperature]).to be_a Float
      expect(result[:data][:attributes][:weather_at_eta][:conditions]).to be_a String
    end

    it 'can create a road trip over 48 hours', :vcr do
      user = User.create!(email: 'floopygooberstein@aol.com', password: 'verysecret',
                          password_confirmation: 'verysecret')
      params = {
        'origin': 'New York,NY',
        'destination': 'Panama City,Panama',
        'api_key': user.api_key.to_s
      }

      headers = {
        'Content_Type': 'application/json',
        'Accept': 'application/json'
      }

      post('/api/v1/road_trip', headers: headers, params: params.to_json)

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(result[:data][:attributes][:start_city]).to be_a String
      expect(result[:data][:attributes][:end_city]).to be_a String
      expect(result[:data][:attributes][:travel_time]).to be_a String
      expect(result[:data][:attributes][:weather_at_eta][:temperature]).to be_a Float
      expect(result[:data][:attributes][:weather_at_eta][:conditions]).to be_a String
    end
  end
end
