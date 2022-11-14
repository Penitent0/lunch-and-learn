class Api::V1::LearningResourcesController < ApplicationController
  def index
    require 'pry'; binding.pry
    video = YoutubeFacade.country_search(params[:country]).first
    images = UnsplashFacade.country_search(params[:country])

    render json: MediaSerializer.media(params[:country], video, images)
  end
end
