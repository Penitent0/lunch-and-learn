class YoutubeService 
  def self.conn 
    Faraday.new('https://www.googleapis.com')
  end

  def self.parse(api_key)
    JSON.parse(api_data.body, symbolize_names: true)
  end
end