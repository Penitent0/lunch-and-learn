require 'rails_helper'

RSpec.describe EdamamFacade, type: :facade do
  describe 'gets Edamam service endpoints and instantiates poros', vcr: { record: :new_episodes } do
    it 'instantiates' do
      expect(EdamamFacade.new).to be_a(EdamamFacade)
    end

    it 'instantiates recipe info poro' do
      recipes = EdamamFacade.recipe_search('mexico')

      expect(recipes).to be_a(Array)

      recipes.each do |recipe|
        expect(recipe).to be_a(EdamamRecipe)
        expect(recipe.country).to eq('mexico')
      end
    end
  end
end