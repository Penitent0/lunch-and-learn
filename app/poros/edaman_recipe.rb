class EdamanRecipe
  attr_accessor :url,
                :title,
                :image,
                :country

  def initialize(api)
    require 'pry'; binding.pry
    @url = api[:url]
    @title = api[:label]
    @image = api[:image]
    @country = nil
  end
end
