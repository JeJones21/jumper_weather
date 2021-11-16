require 'rails_helper'

RSpec.describe 'unsplash image facade' do
  it 'returns a background image object' do
    response = UnsplashImageFacade.find_photo("Louisville, KY")

    expect(response).to be_a(BackgroundImage)
  end
end
