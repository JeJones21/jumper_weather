require 'rails_helper'

RSpec.describe Forecast do
  it 'exists and has attributes' do
    data = { current: { temp: 44 }, daily: [ { temp: 44 } ], hourly: [ { temp: 44 } ] }
    forecast = Forecast.new(data)

    expect(forecast).to be_a(Forecast)
    expect(forecast.current).to be_a(Hash)
    expect(forecast.daily).to be_a(Array)
    expect(forecast.hourly).to be_a(Array)
  end
end
