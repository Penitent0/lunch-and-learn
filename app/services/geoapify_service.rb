class GeoapifyService
  def self.tourist_info_endpoint(lat, lng)
    response = conn.get("/v2/places?filter=circle:#{lng},#{lat},20000")
    parse(response)
  end

  private

  def self.conn 
    Faraday.new(url: 'https://api.geoapify.com') do |f|
      f.params['apiKey'] = ENV['geoapify_api_key']
      f.params['categories'] = 'tourism.sights'
    end
  end

  def self.parse(api_data)
    JSON.parse(api_data.body, symbolize_names: true)
  end
end