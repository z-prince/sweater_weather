module Api
  module V1
    class MunchiesController < ApplicationController
      def index
        if params[:food].blank?
          render json: { errors: { data: 'missing food parameter' } }, status: 400
        elsif params[:location].blank?
          render json: { errors: { data: 'missing location parameter' } }, status: 400
        else
          forecast = ForecastFacade.create_forecast(params[:location])
          restaurant = RestaurantFacade.create_restaurant(params[:location], params[:food])

          render json: RestaurantSerializer.format_restaurant(forecast, restaurant)
        end
      end
    end
  end
end
