class EdamanService 
  def self.conn 
    Faraday.new(url: 'https://api.edamam.com') do |f|
      f.params['app_id'] = ENV['edamam_api_id']
      f.params['app_key'] = ENV['edaman_api_key']
      f.params['type'] = 'public'
    end
  end

  def self.recipe_search(country)
    response = conn.get('/api/recipes/v2', q: country )
    parse(response)
  end

  def self.parse(api_data)
    JSON.parse(api_data.body, symbolize_names: true)
  end
end