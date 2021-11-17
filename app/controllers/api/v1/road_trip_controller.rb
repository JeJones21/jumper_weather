class Api::V1::RoadTripController < ApplicationController
  before_action :require_valid_key
  before_action :require_origin_and_destination

  def create
    if details
      coordinates = MapFacade.find_location(destination)
      arrival_weather = WeatherFacade.check_the_weatha(coordinates, details)
      render json: RoadTripSerializer.new(origin, destination, details, arrival_weather)
    else
      render json: RoadTripSerializer.impossible(origin, destination)
    end
  end

  private

  def details
    details = MapFacade.get_the_deets(origin, destination)
  end

  def origin
    params[:origin]
  end

  def destination
    params[:destination]
  end

  def require_valid_key
    user = User.find_by(access_token: params[:api_key])
    unauthorized unless user
  end

  def require_origin_and_destination
    render json: { message: "bad request" }, status: :bad_request unless origin && destination
  end
end
