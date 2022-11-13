class EdamanFacade 
  def self.recipe_search(country)
    EdamanService.recipe_search_endpoint(country)[:hits].map do |recipe|
      recipe_hash = recipe[:recipe]
      EdamanRecipe.new(recipe_hash[:url], recipe_hash[:label], recipe_hash[:image], country)
    end
  end
end
