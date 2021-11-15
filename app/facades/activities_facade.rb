class ActivitiesFacade
  class << self
    def things_to_do(location, forecast)
      locate = MapService.location_data(location)
      lat = locate[:results][0][:locations][0][:latLng][:lat]
      lng = locate[:results][0][:locations][0][:latLng][:lng]
      forecast_data = WeatherService.weather_data(lat, lng)
      activity_data = ActivitiesService.find_activities(type)

      ActivityForecast.new(locate, forecast_data, activity_data)
    end
  end
end
