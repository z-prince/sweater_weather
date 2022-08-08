require 'rails_helper'

RSpec.describe 'User requests' do
  describe 'create user' do
    it 'can create a user', :vcr do
      post '/api/v1/users', params: {
        email: 'coolguy27@aol.com',
        password: 'secret',
        password_confirmation: 'secret'
      }, as: :json
    end
  end
end
