class Api::V1::ActivitiesController < ApplicationController
  def index
    location = params[:location]
    forecast = params[:forecast]
    activities = ActivitiesFacade.things_to_do(location, forecast)
    render json: ActivitiesSerializer.new(activities)
  end
end
