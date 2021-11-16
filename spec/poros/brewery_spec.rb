require 'rails_helper'

RSpec.describe Brewery do
  it 'exists and has attributes' do
    brewery = Brewery.new({id: 5555, name: 'JJs vomit box', brewery_type: 'brewpub'})

    # expect(brewery).to be_a(Brewery)
    # expect(brewery.name).to eq('JJs vomit box')
    # expect(brewery.brewery_type).to eq('brewpub')
  end
end
