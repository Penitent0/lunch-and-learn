require 'rails_helper'

RSpec.describe "LearningResources", type: :request do
  describe "GET /learning_resources" do
    it "returns http success" do
      get "/learning_resources/"
      expect(response).to have_http_status(:success)
    end

    it 'returns correct json object' do
      get "/api/v1/learning_resources", params: { country: "Germany" }
      expect(response).to be_successful

      learning_resource = JSON.parse(response.body, symbolize_names: true)

      require 'pry'; binding.pry
    end
  end
end
