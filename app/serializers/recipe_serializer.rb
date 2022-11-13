class RecipeSerializer 
  def self.recipes(recipes)
    {
      data: recipes.map do |recipe|
      { id: "null",
        type: "recipe",
        attributes: {
          title: recipe.title,
          url: recipe.url,
          country: recipe.country,
          url: recipe.url
        }
      }
      end
    }
  end
end