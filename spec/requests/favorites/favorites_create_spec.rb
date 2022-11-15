require 'rails_helper'

RSpec.describe "Favorites", type: :request do
  describe "GET /create", vcr: { record: :new_episodes } do
    before :each do
      valid_user = User.create!(name: "Valid", email: "supervalid@validmail.com", password: "test", password_confirmation: "test", api_key: "012345")
    end

    it "returns http created on successful favorite creation" do
      valid_params = {
        api_key: "012345",
        country: "Czechia",
        recipe_link: "https://www.recipes.com",
        recipe_title: "Best Recipe On The Internet"
      }

      expect { post "/api/v1/favorites", params: valid_params }.to change(Favorite, :count).by(+1)

      expect(response).to have_http_status(:created)
    end

    it 'has sad path if user api_key is not found' do
      invalid_params = {
        api_key: "543210",
        country: "Czechia",
        recipe_link: "https://www.recipes.com",
        recipe_title: "Best Recipe On The Internet"
      }

      post "/api/v1/favorites", params: invalid_params

      expect(response).to have_http_status(:bad_request)
    end

    it 'has sad path if favorites required params are not includedin request' do 
      invalid_params = {
        api_key: "012345",
        country: "Czechia",
        recipe_link: "https://www.recipes.com"
      }

      post "/api/v1/favorites", params: invalid_params

      expect(response).to have_http_status(:bad_request)
    end
  end
end
