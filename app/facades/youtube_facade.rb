class YoutubeFacade 
  def self.country_search(country)
    YoutubeService.country_search_endpoint(country)[:items].map do |video|
      YoutubeCountryVideo.new(country, video[:id][:videoId], video[:snippet][:title])
    end
  end
end