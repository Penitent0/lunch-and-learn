class RestCountriesService
  def self.all_countries_endpoint
    response = conn.get('/v3.1/all')
    parse(response)
  end

  private

  def self.conn
    Faraday.new('https://restcountries.com')
  end

  def self.parse(api_data)
    JSON.parse(api_data.body, symbolize_names: true)
  end
end