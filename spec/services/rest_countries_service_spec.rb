require 'rails_helper'

RSpec.describe RestCountriesService, type: :service do
  describe 'gets endpoints from rest countries api', vcr: { record: :new_episodes } do
    it 'instantiates' do
      expect(RestCountriesService.new).to be_a(RestCountriesService)
    end

    it 'has successful response on connection' do
      response = RestCountriesService.conn.get('/v3.1/all')
      expect(response.status).to eq(200)
    end

    it 'has all countries endpoint' do
      response = RestCountriesService.all_countries_endpoint 
      expect(response).to be_a(Array)
      response.each do |country|
        expect(country).to be_a(Hash)
        expect(country).to have_key(:name)
        expect(country[:name]).to be_a(Hash)
        expect(country[:name][:common]).to be_a(String)
      end
    end

    it 'has one country endpoint' do
      response = RestCountriesService.one_country_endpoint('France')
      
      expect(response).to be_a(Array)
      expect(response.first).to have_key(:name)
      expect(response.first[:name][:common]).to eq('France')
      expect(response.first[:latlng]).to be_a(Array)
      expect(response.first[:latlng].first).to be_a(Float)
    end
  end
end