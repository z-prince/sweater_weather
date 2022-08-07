module Api
  module V1
    class ForecastController < ApplicationController
      def index
        render json: ForecastSerializer.format_weather(ForecastFacade.create_forecast(params[:location]))
      end
    end
  end
end
