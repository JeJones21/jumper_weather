require 'rails_helper'

RSpec.describe 'user#create' do
  it 'creates a user' do
    body = {
      email: "jj@dev.com",
      password: "password",
      password_confirmation: "password"
    }

    post '/api/v1/users', params: body

    expect(response).to be_successful
    expect(response.status).to eq(201)

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user).to have_key(:data)
    expect(user[:data]).to be_a(Hash)
    expect(user[:data][:type]).to eq("users")
    expect(user[:data][:attributes][:email]).to eq(body[:email])
    expect(user[:data][:attributes][:api_key]).to be_a(String)
    expect(user[:data][:attributes]).to_not have_key(:password)
  end

  it 'has 400 error and message if email already taken' do
    jj = User.create(email: "jj@dev.com", password_digest: "bbbaaa", access_token: "575757557x")
    body = {
      email: "jj@dev.com",
      password: "password",
      password_confirmation: "password"
    }

    post '/api/v1/users', params: body

    user = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(:bad_request)
    expect(user).to eq({ error: "user already exists" })
  end
end
