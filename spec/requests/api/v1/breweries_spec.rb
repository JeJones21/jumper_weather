require 'rails_helper'

RSpec.describe '/breweries' do
  it "can list breweries based off of location and forecast" do
    get '/api/v1/breweries?location=louisville,ky&quantity=2'
    expect(response).to be_successful

    brew_info = JSON.parse(response.body, symbolize_names: true)

    expect(brew_info).to be_a(Hash)
    expect(brew_info[:data]).to be_a(Hash)
  end

  # it "errors out if params are blank" do
  #   get '/api/v1/breweries?location='
  #   expect(response).to be_unsuccessful
  # end
  #this sad path needs to be refactored.
end
