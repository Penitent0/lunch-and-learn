require 'rails_helper'

RSpec.describe EdamanFacade, type: :facade do
  require 'pry'; binding.pry
  describe 'gets edaman service endpoints and instantiates poros', vcr: { record: :new_episodes } do
    it 'instantiates' do
      expect(EdamanFacade.new).to be_a(EdamanFacade)
    end

    it 'instantiates recipe info poro' do
      recipes = EdamanFacade.recipe_search('mexico')

      expect(recipes).to be_a(Array)

    end
  end
end