class RestCountriesFacade
  def self.all_countries
    countries = RestCountries.new
    RestCountriesService.all_countries_endpoint.flat_map { |country| countries.add_countries(country[:name][:common]) }
  end

  def self.one_country_lat_lng(country)
    country = RestCountriesService.one_country_endpoint(country).first
    
  end
end