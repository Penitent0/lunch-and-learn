require 'rails_helper'

RSpec.describe 'tourist_sights' do
  describe 'GET /tourist_sights', vcr: { record: :new_episodes } do
    it 'has successful http status' do
      get "/api/v1/tourist_sights", params: { country: "Mexico" }

      expect(response).to be_successful

      get "/api/v1/tourist_sights", params: { country: "Latvia" }

      expect(response).to be_successful

      get "/api/v1/tourist_sights", params: { country: "France" }

      expect(response).to be_successful
    end

    it 'has correst json response structure' do 
      get "/api/v1/tourist_sights", params: { country: "Mexico" }

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

    it 'has sad path if country params does not match REST countries list' do
      get "/api/v1/tourist_sights", params: { country: "Made Up Country" }

      expect(response).to have_http_status(:bad_request)

      get "/api/v1/tourist_sights", params: { country: "1234567890" }

      expect(response).to have_http_status(:bad_request)

      get "/api/v1/tourist_sights", params: { country: "Franc" }

      expect(response).to have_http_status(:bad_request) 
    end
  end
end