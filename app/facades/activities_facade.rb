class ActivitiesFacade
  class << self
    def things_to_do(destination)
      location = MapFacade.find_location(destination)
      forecast = WeatherFacade.find_weather(location.latitude, location.longitude)
      activities = []
      activities << ActivitiesService.find_activities('relaxation')
      
      if forecast.current[:temp] >= 60
        activities << ActivitiesService.find_activities('recreational')
      elsif forecast.current[:temp] >= 50 && forecast.current[:temp] < 60
        activities << ActivitiesService.find_activities('busywork')
      else
        activities << ActivitiesService.find_activities('cooking')
      end

      Activity.new(destination: destination, forecast: forecast, activities: activities)
    end
  end
end
