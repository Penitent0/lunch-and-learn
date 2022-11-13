class EdamamRecipe
  attr_reader :url,
              :title,
              :image,
              :country

  def initialize(url, label, image, country)
    @url = url
    @title = label
    @image = image
    @country = country
  end
end
