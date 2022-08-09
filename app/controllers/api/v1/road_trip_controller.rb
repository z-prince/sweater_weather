module Api
  module V1
    class RoadTripController < ApplicationController
      def create
        if api_authentication(road_trip_params[:api_key])
          road_trip = RoadTripFacade.create_roadtrip(road_trip_params[:origin], road_trip_params[:destination])
          current_weather = ForecastFacade.create_current_forecast(road_trip)
          render json: RoadTripSerializer.format_road_trip(road_trip, current_weather)
        else
          render json: { errors: 'Unknown API key' }
        end
      end

      private

      def api_authentication(api_key)
        User.find_by(api_key: api_key)
      end

      def road_trip_params
        JSON.parse(request.raw_post, symbolize_names: true)
      end
    end
  end
end
