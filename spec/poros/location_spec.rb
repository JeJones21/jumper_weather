require 'rails_helper'

RSpec.describe Location do
  it 'exists and has attributes' do
    location = Location.new({lat: 38.256078, lng: -85.751569})

    expect(location).to be_a(Location)
    expect(location.latitude).to eq(38.256078)
    expect(location.longitude).to eq(-85.751569)
  end
end
