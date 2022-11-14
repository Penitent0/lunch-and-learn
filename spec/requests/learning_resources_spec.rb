require 'rails_helper'

RSpec.describe "LearningResources", type: :request do
  describe "GET /learning_resources", vcr: { record: :new_episodes } do
    it "returns http success" do
      get "/api/v1/learning_resources"
      expect(response).to have_http_status(:success)
    end

    it 'returns correct json object' do
      get "/api/v1/learning_resources", params: { country: "Germany" }
      expect(response).to be_successful

      learning_resource = JSON.parse(response.body, symbolize_names: true)

      expect(learning_resource).to be_a(Hash)
      expect(learning_resource).to have_key(:data)
      expect(learning_resource[:data]).to be_a(Hash)
      expect(learning_resource[:data]).to have_key(:id)
      expect(learning_resource[:data][:id]).to eq("null")
      expect(learning_resource[:data]).to have_key(:attributes)
      expect(learning_resource[:data][:attributes]).to be_a(Hash)
      expect(learning_resource[:data][:attributes][:country]).to eq("Germany")
      expect(learning_resource[:data][:attributes]).to have_key(:video)
      expect(learning_resource[:data][:attributes][:video]).to be_a(Hash)
      expect(learning_resource[:data][:attributes][:video][:title]).to be_a(String)
      expect(learning_resource[:data][:attributes][:video][:youtube_video_id]).to be_a(String)
      expect(learning_resource[:data][:attributes][:images]).to be_a(Array)
      learning_resource[:data][:attributes][:images].each do |image|
        expect(image[:alt_tag]).to be_a(String)
        expect(image[:url]).to be_a(String)
      end
    end

    it 'returns empty arrays for video and images if no images or videos are found' do 
      get "/api/v1/learning_resources", params: { country: "planedogcatbirdbuildingshovel" }
      expect(response).to be_successful

      learning_resource = JSON.parse(response.body, symbolize_names: true)

      expect(learning_resource[:data][:attributes][:video]).to eq([])
      expect(learning_resource[:data][:attributes][:images]).to eq([])
      expect(learning_resource[:data][:attributes][:country]).to eq("planedogcatbirdbuildingshovel")

      get "/api/v1/learning_resources", params: { country: "1234567890" }
      expect(response).to be_successful

      learning_resource = JSON.parse(response.body, symbolize_names: true)

      expect(learning_resource[:data][:attributes][:video]).to eq([])
      expect(learning_resource[:data][:attributes][:images]).to eq([])
      expect(learning_resource[:data][:attributes][:country]).to eq("1234567890")
    end
  end
end
