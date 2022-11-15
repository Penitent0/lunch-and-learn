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
        recipe_link: "https://www.recipes.com".
        reciple_title: "Best Recipe On The Internet"
      }
      expect { post "/api/v1/favorites", params: valid_params }.to change(Favorite, :count).by(+1)
    end
  end

end
