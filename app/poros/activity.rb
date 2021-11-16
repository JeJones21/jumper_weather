class Activity
  attr_reader :id, :destination, :forecast, :activities

  def initialize(data)
    @id = nil
    @destination = data[:destination]
    @forecast = format_forecast(data)
    @activities = format_activities(data)
    end
  end

  private

  def format_forecast(data)
    {
      summary: data[:forecast].current[:weather].first[:description],
      temperature: data[:forecast].current[:temp].to_s + ' F'
    }
  end

  def format_activities(data)
    data[:activities].map do |act|
      {
        title: act[:activity],
        type: act[:type],
        participants: act[:participants],
        price: act[:price]
      }
  end
end
