require 'rails_helper'

RSpec.describe 'BreweriesService' do
  it "will find breweries based on location" do
    info = BreweriesService.find_breweries(38.256078, -85.751569)

    expect(info).to be_an(Array)
    expect(info[0].class).to eq(Hash)
    expect(info[0][:id]).to eq("bluegrass-brewing-co-brewpub-louisville")
    expect(info[0][:name]).to eq("Bluegrass Brewing Co - Brewpub")
    expect(info[0][:brewery_type]).to eq("brewpub")
  end
end
