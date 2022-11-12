class EdamanRecipe
  attr_reader :url,
              :title,
              :image,
              :country

  def initialize(api, country)
    @url = api[:url]
    @title = api[:label]
    @image = api[:image]
    @country = country
  end
end
