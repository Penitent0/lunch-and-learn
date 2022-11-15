require 'rails_helper'

RSpec.describe 'Favorites Delete' do
  describe 'DELETE /favorites', vcr: { record: :new_episodes } do
    before :each do
      @valid_user = User.create!(name: "User", email: "supervalid@validmail.com", password: "test", password_confirmation: "test", api_key: "012345")

      @favorite_1 = Favorite.create!(user_id: @valid_user.id, country: "Germany", recipe_link: "https://www.recipes.com", recipe_title: "Best Recipe On The Internet")

      @favorite_2 = Favorite.create!(user_id: @valid_user.id, country: "Peru", recipe_link: "https://www.recipes.com/peru", recipe_title: "Another great recipe")
    end

    it 'has http status no content on successful deletion of record' do
      valid_params = {
        api_key: @valid_user.api_key,
        favorite_id: @favorite_1.id
      }
      expect { delete "/api/v1/favorites", params: valid_params }.to change(Favorite, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end

    it 'returns http status not found with appropriate message if favorite id is not found' do
      invalid_params_bad_id = {
        api_key: @valid_user.api_key,
        favorite_id: "100"
      }

      delete "/api/v1/favorites", params: invalid_params_bad_id

      expect(response).to have_http_status(:not_found)

      error_message = JSON.parse(response.body, symbolize_names: true)

      expect(error_message[:error]).to eq("Couldn't find Favorite with 'id'=100")

      invalid_params_no_id = {
        api_key: @valid_user.api_key
      }

      delete "/api/v1/favorites", params: invalid_params_no_id

      expect(response).to have_http_status(:not_found)

      error_message = JSON.parse(response.body, symbolize_names: true)

      expect(error_message[:error]).to eq("Couldn't find Favorite without an ID")
    end
  end
end