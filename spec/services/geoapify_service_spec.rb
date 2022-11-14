require 'rails_helper'

RSpec.describe GeoapifyService, type: :service do
  describe 'gets endpoints from geoapify API', vcr: { record: :new_episodes } do
    it 'instantiates' do
      expect(GeoapifyService.new).to be_a(GeoapifyService)
    end

    it 'has tourist info endpoint' do
      response = GeoapifyService.tourist_info_endpoint(47.6062, 122.3321)
      
    end
  end
end