class Api::V1::BreweriesController < ApplicationController
  def index
    if params[:quantity].to_i > 0
      location = params[:location]
      quantity = (params[:quantity]).to_i
      breweries = BreweriesFacade.find_breweries(location, quantity)
      render json: BreweriesForecastSerializer.new(breweries)
    else
      render json: {error: "Please enter all required fields"}
    end
  end
end
