class GeoapifyFacade 
  def self.tourist_info(lat, lng)
    GeoapifyService.tourist_info_endpoint(lat, lng)[:features].map do |feature|
      TouristSightInfo.new(feature[:properties][:name], feature[:properties][:formatted], feature[:properties][:place_id])
    end
  end
end