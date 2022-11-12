require 'rails_helper'

RSpec.describe EdamanFacade, type: :facade do
  describe 'gets edaman service endpoints and instantiates poros', vcr: { record: :new_episodes } do
    it 'instantiates' do
      expect(EdamanFacade.new).to be_a(EdamanFacade)
    end

    it 'instantiates recipe info poro' do
      recipes = EdamanFacade.recipe_search('mexico')

      recipes.each do |recipe| 
        expect(recipe).to be_a(EdamanRecipe)
      end
    end
  end
end