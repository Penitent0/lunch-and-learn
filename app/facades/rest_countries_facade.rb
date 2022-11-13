class RestCountriesFacade
  def self.all_countries
    countries = RestCountries.new
    RestCountriesService.all_countries_endpoint.flat_map { |country| countries.add_countries(country[:name][:common]) }
  end
end