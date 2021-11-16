class BreweriesService
  class << self
    def find_breweries(latitude, longitude)
      response = conn.get("/breweries?by_dist=#{latitude},#{longitude}")
      parse_json(response)
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    private

    def conn
      Faraday.new(url: 'https://api.openbrewerydb.org')
    end
  end
end
