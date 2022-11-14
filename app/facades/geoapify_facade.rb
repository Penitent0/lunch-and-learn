class GeoapifyFacade 
  def self.tourist_info(lat, long)
    GeoapifyService.tourist_info_endpoint(lat, lng)[:features].map do |feature|
      TouristSightInfo.new(feature)
    end
  end
end