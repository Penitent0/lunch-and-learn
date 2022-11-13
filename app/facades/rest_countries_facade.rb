class RestCountriesFacade
  def self.all_countries
    RestCountriesService.all_countries_endpoint.map do |country|
      RestCountry.new(country[:name][:common])
    end
  end
end