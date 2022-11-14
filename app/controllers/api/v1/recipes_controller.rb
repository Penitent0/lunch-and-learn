class Api::V1::RecipesController < ApplicationController
  before_action :verify_country, only: %i[index]

  def index
    recipes = EdamamFacade.recipe_search(params[:country])
    render json: RecipeSerializer.recipes(recipes)
  end

  private

  def verify_country
    if params[:country].nil? || !RestCountriesFacade.all_countries.include?(params[:country].capitalize)
      render json: ErrorSerializer.bad_country, status: 400
    end 
  end

  def country_picker
    RestCountriesFacade.all_countries.sample
  end
end
