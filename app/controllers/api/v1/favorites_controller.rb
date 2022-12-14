class Api::V1::FavoritesController < ApplicationController
  before_action :verify_key

  def index
    user = User.find_by(api_key: params[:api_key])
    render json: FavoriteSerializer.favorites(user.favorites)
  end

  def create
    user = User.find_by(api_key: params[:api_key])
    favorite = user.favorites.new(favorites_params)
    if favorite.save 
      render json: { success: "Favorite added successfully" }, status: 201
    else
      render json: ErrorSerializer.parse_errors(favorite.errors), status: 400
    end
  end

  def destroy
    begin
      favorite = Favorite.find(params[:favorite_id])
    rescue StandardError => e
      return render json: ErrorSerializer.parse_error(e), status: 404
    end
    favorite.destroy
  end

  private 

  def verify_key
    if !User.find_by(api_key: params[:api_key]) || !params[:api_key]
      render json: ErrorSerializer.bad_key, status: 400
    end
  end

  def favorites_params 
    params.permit(:country, :recipe_link, :recipe_title)
  end
end
