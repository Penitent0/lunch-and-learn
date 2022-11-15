class Api::V1::LearningResourcesController < ApplicationController
  before_action :verify_country

  def index
    video = YoutubeFacade.country_search(params[:country]).first
    images = UnsplashFacade.country_search(params[:country])

    render json: MediaSerializer.media(params[:country], video, images)
  end
end
