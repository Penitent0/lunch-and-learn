class Api::V1::LearningResourcesController < ApplicationController
  def index
    video = YoutubeFacade.country_search(params[:country]).first
    require 'pry'; binding.pry
    images = UnsplashFacade.country_search(params[:country])

    render json: MediaSerializer.media(params[:country], video, images)
  end
end
