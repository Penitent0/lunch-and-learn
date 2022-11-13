class RestCountriesFacade 
  def self.all_countries 
    response = RestCountriesService.all_countries_endpoint
    require 'pry'; binding.pry
  end
end