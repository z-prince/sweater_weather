module Api
  module V1
    class UsersController < ApplicationController
      def create
        user = User.new(user_params)
        render json: UserSerializer.new(user), status: :created
      end

      private

      def user_params
        params.require(:user).permit(:email)
      end
    end
  end
end
