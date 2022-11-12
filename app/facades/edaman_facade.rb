class EdamanFacade 
  def self.recipe_search(country)
    EdamanService.recipe_search_endpoint(country)[:hits].map do |recipe|
      EdamanRecipe.new(recipe[:recipe], country)
    end
  end
end
