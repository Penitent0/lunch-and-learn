require 'rails_helper'

RSpec.describe EdamanFacade, type: :facade do
  describe 'gets edaman service endpoints and instantiates poros', vcr: { record: :new_episodes } do
    it 'instantiates' do
      expect(EdamanFacade.new).to be_a(EdamanFacade)
    end
  end
end