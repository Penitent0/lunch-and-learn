require 'rails_helper'

RSpec.describe 'favorites#index', type: :request do
  describe 'GET /index', vcr: { record: :new_episodes } do
    before :each do
      @user_with_recipes = User.create!(name: "User", email: "supervalid@validmail.com", password: "test", password_confirmation: "test", api_key: "012345")

      @favorite_1 = Favorite.create!(user_id: @user_with_recipes.id, country: "Germany", recipe_link: "https://www.recipes.com", recipe_title: "Best Recipe On The Internet")

      @favorite_2 = Favorite.create!(user_id: @user_with_recipes.id, country: "Peru", recipe_link: "https://www.recipes.com/peru", recipe_title: "Another great recipe")

      @user_without_recipes = User.create!(name: "Another User", email: "moremail@validmail.com", password: "test", password_confirmation: "test", api_key: "abcdefg")
    end

    it 'returns http success and favorites for user' do
      get "/api/v1/favorites", params: { api_key: @user_with_recipes.api_key }

      expect(response).to have_http_status(:success)

      user_favorites = JSON.parse(response.body, symbolize_names: true)

      expect(user_favorites).to be_a(Hash)
      expect(user_favorites).to have_key(:data)
      expect(user_favorites[:data]).to be_a(Array)
      user_favorites[:data].each do |favorite|
        expect(favorite[:id]).to be_a(Integer)
        expect(favorite[:type]).to eq("favorite")
        expect(favorite[:attributes]).to be_a(Hash)
        expect(favorite[:attributes][:recipe_link]).to be_a(String)
        expect(favorite[:attributes][:recipe_title]).to be_a(String)
        expect(favorite[:attributes][:country]).to be_a(String)
      end
    end

    it 'returns http success and empty array if user had no favorites' do
      get "/api/v1/favorites", params: { api_key: @user_without_recipes.api_key }

      expect(response).to have_http_status(:success)

      user_favorites = JSON.parse(response.body, symbolize_names: true)

      expect(user_favorites).to be_a(Hash)
      expect(user_favorites).to have_key(:data)
      expect(user_favorites[:data].empty?).to eq(true)
    end

    it 'returns bad request http status if api key is invalid or no api_key with appropriate message' do
      get "/api/v1/favorites", params: { api_key: "Not a Valid Key" }

      expect(response).to have_http_status(:bad_request)

      error_message = JSON.parse(response.body, symbolize_names: true)

      expect(error_message).to be_a(Hash)
      expect(error_message).to have_key(:error)
      expect(error_message[:error]).to eq("Valid Api_key Required")

      get "/api/v1/favorites", params: { api_key: "" }

      expect(response).to have_http_status(:bad_request)

      error_message = JSON.parse(response.body, symbolize_names: true)

      expect(error_message).to be_a(Hash)
      expect(error_message).to have_key(:error)
      expect(error_message[:error]).to eq("Valid Api_key Required")
    end
  end
end
