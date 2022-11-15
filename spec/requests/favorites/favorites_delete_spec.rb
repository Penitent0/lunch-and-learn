require 'rails_helper'

RSpec.describe 'Favorites Delete' do
  describe 'DELETE /favorites', vcr: { record: :new_episodes } do
    before :each do
      valid_user = User.create!(name: "User", email: "supervalid@validmail.com", password: "test", password_confirmation: "test", api_key: "012345")

      @favorite_1 = Favorite.create!(user_id: @valid_user.id, country: "Germany", recipe_link: "https://www.recipes.com", recipe_title: "Best Recipe On The Internet")

      @favorite_2 = Favorite.create!(user_id: @valid_user.id, country: "Peru", recipe_link: "https://www.recipes.com/peru", recipe_title: "Another great recipe")
    end

    it 'has http status no content on successful deletion of record' do
      expect { delete "/api/v1/favorites", params: valid_params }.to change(Favorite, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end