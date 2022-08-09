module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.find_by(email: user_params[:email])
        if !user.nil?
          session[:id] = user[:id]
          render json: UserSerializer.new(user), status: :created
        else
          render json: { errors: 'Invalid credentials' }
        end
      end

      private

      def user_params
        JSON.parse(request.body.read, symbolize_names: true)
      end
    end
  end
end
