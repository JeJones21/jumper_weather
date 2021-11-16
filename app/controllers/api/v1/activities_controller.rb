class Api::V1::ActivitiesController < ApplicationController
  def index
    # location = params[:destination]
    # forecast = params[:forecast]
    activities = ActivitiesFacade.things_to_do(params[:destination])
    render json: ActivitiesSerializer.new(activities)
  end
end
