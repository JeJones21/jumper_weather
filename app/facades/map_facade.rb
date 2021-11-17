class MapFacade
  class << self
    def find_location(location)
      data = MapService.location_data(location)
      result = data[:results].first[:locations].first[:latLng]
      Location.new(result)
    end

    def get_the_deets(from, to)
      data = MapService.route_data(from, to)
      data[:route][:formattedTime]
    end
  end
end
