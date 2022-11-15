require 'rails_helper'

RSpec.describe GeoapifyService, type: :service do
  describe 'gets endpoints from geoapify API', vcr: { record: :new_episodes } do
    it 'instantiates' do
      expect(GeoapifyService.new).to be_a(GeoapifyService)
    end

    it 'has tourist info endpoint for given lat/lng' do
      response = GeoapifyService.tourist_info_endpoint(47.620422,-122.335167)
      
      expect(response).to be_a(Hash)
      expect(response).to have_key(:features)
      expect(response[:features]).to be_a(Array)
      response[:features].each do |feature|
        expect(feature).to be_a(Hash)
        expect(feature).to have_key(:properties)
        expect(feature[:properties]).to be_a(Hash)
        expect(feature[:properties]).to have_key(:name)
        expect(feature[:properties][:name]).to be_a(String)
        expect(feature[:properties][:formatted]).to be_a(String)
        expect(feature[:properties][:place_id]).to be_a(String)
      end
    end
  end
end