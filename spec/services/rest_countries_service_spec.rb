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
      end
    end
  end
end