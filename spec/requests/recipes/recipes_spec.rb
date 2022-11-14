require 'rails_helper'

RSpec.describe "Recipes", vcr: { record: :new_episodes }, type: :request do
  describe "GET /recipes" do
    it "returns http success" do
      get "/api/v1/recipes"

      expect(response).to have_http_status(:success)
    end

    it 'returns array of recipes with id null' do
      get "/api/v1/recipes", params: { country: "Mexico" }
      expect(response).to be_successful

      recipes = JSON.parse(response.body, symbolize_names: true)

      expect(recipes).to be_a(Hash)
      expect(recipes).to have_key(:data)
      expect(recipes[:data]).to be_a(Array)

      recipes[:data].each do |recipe|
        expect(recipe).to have_key(:id)
        expect(recipe[:id]).to eq("null")
        expect(recipe).to have_key(:attributes)
        expect(recipe[:attributes]).to be_a(Hash)
        expect(recipe[:attributes][:country]).to eq("Mexico")
      end
    end

    it 'does not return unncessary data in response' do
      get "/api/v1/recipes", params: { country: "Japan" }

      recipes = JSON.parse(response.body, symbolize_names: true)

      recipes[:data].each do |recipe|
        expect(recipe).to_not have_key(:label)
        expect(recipe).to_not have_key(:source)
        expect(recipe).to_not have_key(:yield)
        expect(recipe).to_not have_key(:dietLabels)
      end
    end
  end
end
