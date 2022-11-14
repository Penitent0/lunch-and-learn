require 'rails_helper'

RSpec.describe GeoapifyService, type: :service do
  describe 'gets endpoints from geoapify API', vcr: { record: :new_episodes } do
    it 'instantiates' do
      expect(GeoapifyService.new).to be_a(GeoapifyService)
    end

    
  end
end