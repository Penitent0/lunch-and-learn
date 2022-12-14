class RestCountriesService
  def self.all_countries_endpoint
    Rails.cache.fetch("all_countries_endpoint", expires_in: 30.days) do
      response = conn.get('/v3.1/all')
      parse(response)
    end
  end

  def self.one_country_endpoint(country)
    response = conn.get("/v3.1/name/#{country}")
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