class ActivityForecast
  attr_reader :id, :destination, :forecast, :activities

  def initialize(locate, forecast_data, activity_data)
    @id = nil
    @destination = locate[:results][0][:providedLocation][:location]
    @forecast = forecasted_data(forecast_data)
    @activities = activities_data(activity_data)
  end

  def forecasted_data(data)
    {
      summary: data[:current][:weather][0][:description],
      temperature: "#{(data[:current][:temp]).to_i} F"
    }
  end

  def activities_data(activity_data)
    activity_data.map do |activity_data|
      {
        title: activity_data[:title],
        type: activity_data[:type],
        participants: activity_data[:participants],
        price: activity_data[:price]
      }
    end
  end
end
