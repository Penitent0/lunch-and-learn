class EdamamFacade 
  def self.recipe_search(country)
    EdamamService.recipe_search_endpoint(country)[:hits].map do |recipe|
      recipe_hash = recipe[:recipe]
      EdamamRecipe.new(recipe_hash[:url], recipe_hash[:label], recipe_hash[:image], country)
    end
  end
end
