require 'rails_helper'

RSpec.describe "LearningResources", type: :request do
  describe "GET /learning_resources" do
    it "returns http success" do
      get "/learning_resources/"
      expect(response).to have_http_status(:success)
    end
  end

end
