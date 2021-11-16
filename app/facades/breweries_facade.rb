class BreweriesFacade
  class << self
    def find_breweries(location, quantity)
      # data = BreweryService.find_breweries(location, quantity)
      locate = MapService.location_data(location)
      lat = locate[:results][0][:locations][0][:latLng][:lat]
      lng = locate[:results][0][:locations][0][:latLng][:lng]
      forecasted_data = WeatherService.weather_data(lat, lng)
      brewery_data = BreweriesService.find_breweries(lat, lng)

      BreweryForecast.new(locate, forecasted_data, brewery_data, quantity)
    end
  end
end
