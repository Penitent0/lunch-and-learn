require 'rails_helper'

RSpec.describe GeoapifyFacade, type: :facade do
  describe 'gets endpoints from geoapify service and instantiates poros', vcr: { record: :new_episodes } do
    it 'instantiates' do
      expect(GeoapifyFacade.new).to be_a(GeoapifyFacade)
    end
  end
end