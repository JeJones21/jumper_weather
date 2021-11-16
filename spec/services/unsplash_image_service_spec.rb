require 'rails_helper'

RSpec.describe 'unsplash image service' do
  it 'returns image data given a location' do
    response = UnsplashImageService.image_data("Louisville, KY")

    expect(response).to have_key(:results)
    expect(response[:results]).to be_an(Array)
    expect(response[:results].first).to have_key(:user)
    expect(response[:results].first).to have_key(:urls)
  end
end
