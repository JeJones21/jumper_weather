class BreweryForecast
  attr_reader :id, :destination, :forecast, :breweries

  def initialize(locate, forecasted_data, brewery_data, quantity)
    @id = nil
    @destination = locate[:results][0][:providedLocation][:location]
    @forecast = forecasted_data(forecasted_data)
    @breweries = breweries_data(brewery_data).take(quantity)
  end

  def forecasted_data(data)
    {
      summary: data[:current][:weather][0][:description],
      temperature: "#{(data[:current][:temp]).to_i} F"
    }
  end

  def breweries_data(brewery_data)
    brewery_data.map do |brewery_data|
      {
        id: brewery_data[:id],
        name: brewery_data[:name],
        brewery_type: brewery_data[:brewery_type]
      }
    end
  end
end