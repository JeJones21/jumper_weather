class MapFacade
  class << self
    def find_location(location)
      data = MapService.location_data(location)
      result = data[:results].first[:locations].first[:latLng]
      Location.new(result)
    end
  end
end
