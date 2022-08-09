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

      expect(response).to have_http_status(201)
      expect(result[:attributes][:start_city]).to eq('Denver, CO')
      expect(result[:attributes][:end_city]).to eq('Pueblo, CO')
      expect(result[:attributes][:travel_time]).to be_a String
      expect(result[:attributes][:weather_at_eta][:temperature]).to be_a Integer
      expect(result[:attributes][:weather_at_eta][:conditions]).to be_a String
    end
  end
end
