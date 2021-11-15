class ActivitiesService
  def self.find_activities(type)
    response = conn.get("/api/activity?type=#{type}")
    parse_json(response)
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def self.conn
    Faraday.new(url: 'http://www.boredapi.com')
  end
end
