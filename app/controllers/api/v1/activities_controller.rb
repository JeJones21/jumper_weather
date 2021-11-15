class Api::V1::ActivitiesController < ApplicationController
  def index
    location = params[:destination
    forecast = params[:forecast]
    activities = ActivitiesFacade.things_to_do(temp)
    render json: ActivitiesSerializer.new(activities)
  end
end
