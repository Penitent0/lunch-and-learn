require 'rails_helper'

RSpec.describe GeoapifyFacade, type: :facade do
  describe 'gets endpoints from geoapify service and instantiates poros', vcr: { record: :new_episodes } do
    it 'instantiates' do
      expect(GeoapifyFacade.new).to be_a(GeoapifyFacade)
    end

    it 'instantiates tourist sight info poros' do
      sights = GeoapifyFacade.tourist_info(47.620422,-122.335167)

      expect(sights).to be_a(Array)
      sights.each do |sight|
        expect(sight).to be_a(TouristSightInfo)
        expect(sight.name).to be_a(String)
        expect(sight.address).to be_a(String)
        expect(sight.place_id).to be_a(String)
      end
    end
  end
end