class UnsplashService
  def self.country_search_endpoint(country)
    response = conn.get('/search/photos', query: country)
    parse(response)
  end

  private

  def self.conn 
    Faraday.new(url: 'https://api.unsplash.com') do |f|
      f.params['client_id'] = ENV['unsplash_api_key']
      f.params['content_filter'] = 'high'
      f.params['page'] = 1
      f.params['per_page'] = 10
    end
  end

  def self.parse(api_data)
    JSON.parse(api_data.body, symbolize_names: true)
  end
end