class YoutubeFacade 
  def self.country_search(country)
    video = YoutubeService.country_search_endpoint(country)[:items].first
    YoutubeCountryVideo.new(country, video[:id][:videoId], video[:snippet][:title])
  end
end