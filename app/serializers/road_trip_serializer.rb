class RoadTripSerializer
  def self.new(origin, destination, time, arrival_weather)
    {
      "data": {
        "id": nil,
        "type": "roadtrip",
        "attributes": {
          "start_city": origin,
          "end_city": destination,
          "travel_time": time,
          "weather_at_eta": {
            "temperature": arrival_weather.temperature,
            "conditions": arrival_weather.conditions
          }
        }
      }
    }
  end

  def self.impossible(origin, destination)
    {
      "data": {
        "id": nil,
        "type": "roadtrip",
        "attributes": {
          "start_city": origin,
          "end_city": destination,
          "travel_time": "impossible"
        }
      }
    }
  end
end
