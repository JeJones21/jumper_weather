class ActivitiesFacade
  class << self
    def things_to_do(temp)
      activity_data1 = if temp >= 60
          ActivitiesService.find_activities("recreational")
        elsif temp >= 50 && temp < 60
          ActivitiesService.find_activities("busywork")
        else
          ActivitiesService.find_activities("cooking")
        end
        activity_data2 = ActivitiesService.activity_data("relaxation")
        [Activity.new(activity_data1), Activity.new(activity_data2)]
        end
      end
    end
