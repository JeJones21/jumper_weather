class WeatherFacade
  class << self
    def find_weather(latitude, longitude)
      data = WeatherService.weather_data(latitude, longitude)
      Forecast.new(data)
    end
  end
end
