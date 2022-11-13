class YoutubeFacade 
  def self.country_search(country)
    YoutubeService.country_search_endpoint(country)[:items].first do |item|
      require 'pry'; binding.pry
      YoutubeCountryVideo.new(country, item[:id][:videoId], item[:snippet][:title])
    end
  end
end