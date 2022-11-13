class UnsplashCountryPhoto 
  attr_reader :country,
              :alt_tag,
              :url

  def initialize(country, tag, url)
    @country = country
    @alt_tag = tag
    @url = url
  end
end