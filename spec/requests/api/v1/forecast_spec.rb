require 'rails_helper'

RSpec.describe 'forecast request', :vcr do
  it "can get city weather" do
     get '/api/v1/forecast?location=louisville,ky'

     weather = JSON.parse(response.body, symbolize_names: true)
     expect(response).to be_successful
     expect(weather).to be_a(Hash)
     expect(weather).to have_key(:data)
     expect(weather[:data]).to be_a(Hash)

     expect(weather[:data]).to have_key(:id)
     expect(weather[:data]).to have_key(:type)
     expect(weather[:data]).to have_key(:attributes)
     expect(weather[:data][:attributes]).to be_a(Hash)
     expect(weather[:data][:attributes]).to have_key(:current_weather)

     expect(weather[:data][:attributes][:current_weather]).to be_a(Hash)
     expect(weather[:data][:attributes][:current_weather]).to have_key(:datetime)
     expect(weather[:data][:attributes][:current_weather][:datetime]).to be_a(String)
     expect(weather[:data][:attributes][:current_weather]).to have_key(:sunrise)
     expect(weather[:data][:attributes][:current_weather][:sunrise]).to be_a(String)
     expect(weather[:data][:attributes][:current_weather]).to have_key(:sunset)
     expect(weather[:data][:attributes][:current_weather][:sunset]).to be_a(String)
     expect(weather[:data][:attributes][:current_weather]).to have_key(:temperature)
     expect(weather[:data][:attributes][:current_weather][:temperature]).to be_a(Float)
     expect(weather[:data][:attributes][:current_weather]).to have_key(:feels_like)
     expect(weather[:data][:attributes][:current_weather][:feels_like]).to be_a(Float)
     expect(weather[:data][:attributes][:current_weather]).to have_key(:humidity)
     expect(weather[:data][:attributes][:current_weather][:humidity]).to be_a(Integer)
     expect(weather[:data][:attributes][:current_weather]).to have_key(:uvi)
     expect(weather[:data][:attributes][:current_weather][:uvi]).to be_a(Integer)
     expect(weather[:data][:attributes][:current_weather]).to have_key(:visibility)
     expect(weather[:data][:attributes][:current_weather][:visibility]).to be_a(Integer)
     expect(weather[:data][:attributes][:current_weather]).to have_key(:conditions)
     expect(weather[:data][:attributes][:current_weather][:conditions]).to be_a(String)
     expect(weather[:data][:attributes][:current_weather]).to have_key(:icon)
     expect(weather[:data][:attributes][:current_weather][:icon]).to be_a(String)

     expect(weather[:data][:attributes]).to have_key(:daily_weather)
     expect(weather[:data][:attributes][:daily_weather]).to be_an(Array)
     expect(weather[:data][:attributes][:daily_weather].first).to be_an(Hash)
     expect(weather[:data][:attributes][:daily_weather].first).to have_key(:date)
     expect(weather[:data][:attributes][:daily_weather].first[:date]).to be_a(String)
  end
end
