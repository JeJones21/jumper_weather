class WeatherFacade
  class << self
    def find_weather(latitude, longitude)
      data = WeatherService.weather_data(latitude, longitude)
      Forecast.new(data)
    end

    def check_the_weatha(coordinates, time)
      data = WeatherService.weather_data(coordinates.latitude, coordinates.longitude)
      hourly_forecasts = data[:hourly].map do |hour|
        HourlyWeather.new(hour)
      end
      hours = trip_length(time)
      hourly_forecasts[hours]
    end

    private

    def trip_length(time)
      time.split(':').first.to_i
    end
  end
end
