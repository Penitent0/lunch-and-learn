class YoutubeService
  def self.country_search_endpoint(country)
    response = conn.get('youtube/v3/search', q: country)
    parse(response)
  end

  private

  def self.conn 
    Faraday.new(url: 'https://www.googleapis.com') do |f|
      f.params['channelId'] = 'UCluQ5yInbeAkkeCndNnUhpw'
      f.params['part'] = 'snippet'
      f.params['key'] = ENV['youtube_api_key']
    end
  end

  def self.parse(api_data)
    JSON.parse(api_data.body, symbolize_names: true)
  end
end