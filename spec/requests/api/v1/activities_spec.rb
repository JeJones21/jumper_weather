require 'rails_helper'

RSpec.describe 'Activities Request' do
  it "can list possible activites based on location weather" do
    get '/api/v1/activities?destination=louisville,ky'

    expect(response).to be_successful
    activities = JSON.parse(response.body, symbolize_names: true)

    expect(activities).to be_a(Hash)
    expect(activities).to have_key(:data)
    expect(activities[:data]).to be_a(Hash)
    expect(activities[:data]).to have_key(:id)
    expect(activities[:data]).to have_key(:type)
    expect(activities[:data]).to have_key(:attributes)
    expect(activities[:data][:attributes]).to be_a(Hash)
  end
end
