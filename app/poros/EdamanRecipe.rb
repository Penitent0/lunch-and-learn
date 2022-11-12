class EdamanRecipe
  attr_accessor :url,
                :title,
                :image,
                :country

  def initialize(api)
    @url = api[:url]
    @title = api[:label]
    @image = api[:image]
    @country = nil
  end
end
