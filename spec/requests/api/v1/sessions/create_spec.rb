require 'rails_helper'

RSpec.describe 'sessions#create' do
  it 'creates a session' do
    jj = User.create!(email: "jj@dev.com", password_digest: "$2a$12$qwOoIpQBkj3/R/CwCzz0LuZLFqrTwcHjtpLnt9U12Rlvc1BsIwiEy", access_token: "4fb2ee88bae9debfdeb2")

    body = {
      email: "jj@dev.com",
      password: "password"
    }

    post '/api/v1/sessions', params: body
    expect(response).to be_successful

    user = JSON.parse(response.body, symbolize_names: true)
    expect(user[:data][:attributes][:api_key]).to be_a(String)
    expect(user[:data][:attributes]).to_not have_key(:password)
  end

  it 'gives a big ole error if the email param is m.i.a.' do
    user_params = {
      password: "password"
    }

    post '/api/v1/sessions', params: user_params

    user = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(:unauthorized)
    expect(user).to eq({ message: 'Credentials are incorrect' })
  end
end
