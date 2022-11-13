class YoutubeFacade 
  def self.country_search(country)
    YoutubeService.country_search_endpoint(country)
  end
end