class Api::V1::FavoritesController < ApplicationController
  before_action :verify_key

  def create
    favorite = Favorite.new(favorites_params)
    if favorite.save 
      render json: { success: "Favorite added successfully" }, status: 201
    else
      render json: ErrorSerializer.parse_errors(favorite)
    end
    require 'pry'; binding.pry
  end

  private 

  def verify_key
    if !User.find_by(params[:api_key]) || !params[:api_key]
      render json: ErrorSerializer.bad_key, status: 400
    end
  end

  def favorites_params 
    require(:favorite).permit(:country, :recipe_link, :recipe_title)
  end
end
