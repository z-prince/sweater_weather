module Api
  module V1
    class MunchiesController < ApplicationController
      def index
        forecast = ForecastFacade.create_forecast(params[:location])
        restaurant = RestaurantFacade.create_restaurant(params[:location], params[:food])

        render json: RestaurantSerializer.format_restaurant(forecast, restaurant)
      end
    end
  end
end
