class UnsplashFacade 
  def self.country_search(country)
    UnsplashService.country_search_endpoint(country)[:results].map do |result|
      UnsplashCountryPhoto.new(country, result[:alt_description], result[:urls][:raw])
    end
  end
end