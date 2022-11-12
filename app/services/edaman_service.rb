class EdamanService 
  def self.conn 
    Faraday.new(url: 'https://api.edamam.com') do |f|
      f.params['app_id'] = ENV['edamam_api_id']
      f.params['app_key'] = ENV['edaman_api_key']
      f.params['type'] = 'public'
    end
  end

  def self.recipe_search(country = nil)
    response = conn.get
  end
end