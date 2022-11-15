class Api::V1::RecipesController < ApplicationController
  before_action :verify_country

  def index
    recipes = EdamamFacade.recipe_search(params[:country])
    render json: RecipeSerializer.recipes(recipes)
  end
end
