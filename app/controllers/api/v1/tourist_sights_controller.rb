class Api::V1::TouristSightsController < ApplicationController 
  def index
    capital_info = RestCountriesFacade.one_country_lat_lng(params[:country])
    sights = GeoapifyFacade.tourist_info(capital_info.lat, capital_info.lng)
    render json: TouristSerializer.sights(sights)
  end
end