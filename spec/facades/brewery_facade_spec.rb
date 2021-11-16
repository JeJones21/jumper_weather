require 'rails_helper'

RSpec.describe 'BreweryFacade' do
  it "returns breweries" do
    info = BreweriesFacade.find_breweries('louisville,ky', 2)
    expect(info).to be_instance_of(BreweryForecast)
  end
end
