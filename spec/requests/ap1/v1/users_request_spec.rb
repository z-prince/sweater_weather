require 'rails_helper'

RSpec.describe 'User requests' do
  describe 'create user' do
    it 'can create a user', :vcr do
      params = {
        'email': 'coolguy23@aol.com',
        'password': 'verysecret',
        'password_confirmation': 'verysecret'
      }

      headers = {
        'Content_Type': 'application/json',
        'Accept': 'application/json'
      }

      post('/api/v1/users', headers: headers, params: params.to_json)

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(201)
      expect(User.all.first.email).to eq('coolguy23@aol.com')
    end
  end

  describe 'user login' do
    it 'can login a user' do
      params = {
        'email': 'coolguy23@aol.com',
        'password': 'verysecret',
        'password_confirmation': 'verysecret'
      }

      headers = {
        'Content_Type': 'application/json',
        'Accept': 'application/json'
      }

      post('/api/v1/users', headers: headers, params: params.to_json)

      params = {
        'email': 'coolguy23@aol.com',
        'password': 'verysecret'
      }

      headers = {
        'Content_Type': 'application/json',
        'Accept': 'application/json'
      }

      post('/api/v1/sessions', headers: headers, params: params.to_json)

      result = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response).to have_http_status(201)
    end

    it 'returns an error if credentials are invalid' do
      params = {
        'email': 'coolguy23@aol.com',
        'password': 'verysecret'
      }

      headers = {
        'Content_Type': 'application/json',
        'Accept': 'application/json'
      }

      post('/api/v1/sessions', headers: headers, params: params.to_json)

      result = JSON.parse(response.body, symbolize_names: true)
      expect(result[:errors]).to eq('Invalid credentials')
    end
  end
end
