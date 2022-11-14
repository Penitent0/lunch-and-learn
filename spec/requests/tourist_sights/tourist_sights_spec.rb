require 'rails_helper'

RSpec.describe 'tourist_sights' do
  describe 'GET /tourist_sights', vcr: { record: :new_episodes } do
    it 'has successful http status and correct json structure' do
      get "/api/v1/tourist_sights", params: { country: "Mexico" }

      expect(response).to be_successful
    
      sights = JSON.parse(response.body, symbolize_names: true)

      expect(sights).to be_a(Hash)
      expect(sights).to have_key(:data)
      expect(sights[:data]).to be_a(Array)
      sights[:data].each do |sight|
        expect(sight).to be_a(Hash)
        expect(sight[:id]).to eq('null')
        expect(sight[:type]).to eq('tourist_sight')
        expect(sight[:attributes]).to be_a(Hash)
        expect(sight[:attributes][:name]).to be_a(String)
        expect(sight[:attributes][:address]).to be_a(String)
        expect(sight[:attributes][:place_id]).to be_a(String)
      end
    end
  end
end