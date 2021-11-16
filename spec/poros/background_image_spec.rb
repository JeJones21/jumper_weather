require 'rails_helper'

RSpec.describe BackgroundImage do
  it 'exists and has attributes' do
    data = {
      user: {
        location: "Louisville, KY",
        name: "Daniel Norris"
      },
      urls: {
        full: "https://images.unsplash.com/photo-1574713600544-ca13b5d573d5?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNzU5MjZ8MHwxfHNlYXJjaHwxfHxsb3Vpc3ZpbGxlJTJDa3l8ZW58MHx8fHwxNjM3MDI2MTEy&ixlib=rb-1.2.1&q=85"
      }
    }

    background = BackgroundImage.new(data)

    expect(background).to be_a(BackgroundImage)
    expect(background.location).to eq("Louisville, KY")
    expect(background.image_url).to eq("https://images.unsplash.com/photo-1574713600544-ca13b5d573d5?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNzU5MjZ8MHwxfHNlYXJjaHwxfHxsb3Vpc3ZpbGxlJTJDa3l8ZW58MHx8fHwxNjM3MDI2MTEy&ixlib=rb-1.2.1&q=85" )
    expect(background.author).to eq("Daniel Norris")
  end
end
