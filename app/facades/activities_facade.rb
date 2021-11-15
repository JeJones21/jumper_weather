class ActivitiesFacade
  class << self
    def things_to_do(destination)
      location = MapFacade.find_location(destination)
      forecast = WeatherFacade.forecast(location.latitude, location.longitude)
      activities = []
      activities << ActivitiesService.find_activities('relaxation')

      if forecast.current.temperature >= 60
        activities << ActivitiesService.find_activities('recreational')
      elsif forecast.current.temperature >= 50 && forecast.current.temperature < 60
        activities << ActivitiesService.find_activities('busywork')
      else
        activities << ActivitiesService.find_activities('cooking')
      end
require "pry"; binding.pry
      Activity.new(destination: destination, forecast: forecast, activities: activities)
    end
  end
end
