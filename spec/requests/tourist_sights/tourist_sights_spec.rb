require 'rails_helper'

Rspec.describe 'tourist_sights' do
  describe 'GET /tourist_sights' vcr: { record: :new_episodes } do
    get "/api/v1/tourist_sights", params: { country: "Mexico" }

    expect(response).to be_successful
    
  end
end