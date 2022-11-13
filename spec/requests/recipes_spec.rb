require 'rails_helper'

RSpec.describe "Recipes", vcr: { record: :new_episodes }, type: :request do
  describe "GET /recipes" do
    it "returns http success" do
      get "/api/v1/recipes"

      expect(response).to have_http_status(:success)
    end

    it 'returns ' do
      get "/api/v1/recipes", params: { country: "Mexico" }
      expect(response).to be_successful

      recipes = JSON.parse(response.body, symbolize_names: true)

      require 'pry'; binding.pry
    end
  end
end
