class Api::V1::ForecastController < ApplicationController
  def index
    location = MapFacade.find_location(params[:location])
    forecast = WeatherFacade.find_weather(location.latitude, location.longitude)
    render json: ForecastSerializer.new(forecast)
  end
end
