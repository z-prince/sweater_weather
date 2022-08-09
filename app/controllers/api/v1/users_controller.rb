module Api
  module V1
    class UsersController < ApplicationController
      def create
        user = User.new(user_params)
        if user.save
          session[:id] = user[:id]
          render json: UserSerializer.new(user), status: :created
        else
          render json: { errors: "Invalid email or passwords don't match" }
        end
      end

      private

      def user_params
        JSON.parse(request.body.read, symbolize_names: true)
      end
    end
  end
end
