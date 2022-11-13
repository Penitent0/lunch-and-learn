require 'rails_helper'

RSpec.describe UnsplashService, type: :service do 
  describe 'gets endpoints from unsplash api', vcr: { record: :new_episodes } do
    it 'instantiates' do
      expect(UnsplashService.new).to be_a(UnsplashService)
    end

    it 'has successful response on connection' do
      response = UnsplashService.conn.get('/search/photos?query=mexico')
      expect(response.status).to eq(200)
    end

    it 'has country search endpoint' do
      response = UnsplashService.country_search_endpoint('Mexico')

      expect(response).to be_a(Hash)
      expect(response).to have_key(:results)
      expect(response[:results]).to be_a(Array)
      expect(response[:results].count).to eq(10)
      response[:results].each do |result|
        expect(result).to have_key(:alt_description)
        expect(result[:alt_description]).to be_a(String)
        expect(result).to have_key(:urls)
        expect(result[:urls][:raw]).to be_a(String)
      end
    end
  end
end