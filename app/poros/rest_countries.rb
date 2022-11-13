class RestCountries
  attr_reader :countries

  def initialize
    @countries = []
  end

  def add_countries(country)
    @countries << country
  end
end