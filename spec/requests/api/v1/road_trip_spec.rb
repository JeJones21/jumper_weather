require 'rails_helper'

RSpec.describe 'roadtrip#endpoint' do
  it "can help you plan the best roadie ever" do
    jj = User.create!(email: "gitlost@iam.com",
                      password_digest: "fearandloathinginlasvegas"
                    )
    body = {
        origin: "Denver,CO",
        destination: "Placitas,NM",
        api_key: "555555555"
    }

    headers = {
       'Content-Type': "application/json",
       'Accept': "application/json"
    }

    post '/api/v1/road_trip', headers: headers, params: body.to_json

    roadtrip = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(roadtrip[:data][:attributes]).to have_key(:start_city)
    expect(roadtrip[:data][:attributes]).to have_key(:end_city)
    expect(roadtrip[:data][:attributes]).to have_key(:travel_time)
    expect(roadtrip[:data][:attributes]).to have_key(:weather_at_eta)
  end

  it 'you are trying to drive across the ocean, it is not going to happen' do
    jj = User.create!(email: "gitlost@iam.com",
                      password_digest: "fearandloathinginlasvegas"
                    )
    body = {
      origin: "Denver,CO",
      destination: "London, England",
      api_key: "555555555"
    }
    headers = {
       'Content-Type': "application/json",
       'Accept': "application/json"
    }

    post '/api/v1/road_trip', params: body

    expect(response).to be_successful

    roadtrip = JSON.parse(response.body, symbolize_names: true)

    expect(roadtrip).to be_a(Hash)
    expect(roadtrip).to have_key(:data)
    expect(roadtrip[:data]).to have_key(:attributes)
    expect(roadtrip[:data][:attributes][:travel_time]).to eq("impossible")
  end
end
