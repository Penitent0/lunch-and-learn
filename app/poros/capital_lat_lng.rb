class CapitalLatLng 
  attr_reader :lat,
              :lng 
  
  def initialize(lat, lng)
    @lat = lat
    @lng = lng
  end
end