require 'rails_helper'

RSpec.describe YoutubeService, type: :service do 
  describe 'gets endpoints from Youtube API', vcr: { record: :new_episodes } do 
    it 'instantiates' do
      expect(YoutubeService.new).to be_a(YoutubeService)
    end

    it 'has successful response on connection' do
      response = YoutubeService.conn.get('youtube/v3/search')
      
      expect(response.status).to eq(200)
    end

    it 'has search by country endpoint' do
      response = YoutubeService.country_search_endpoint('Australia')
      require 'pry'; binding.pry
      expect(response).to be_a(Hash)
      expect(response).to have_key(:items)
      expect(response[:items]).to be_a(Array)
      response[:items].each do |item|
        expect(item).to be_a(Hash)
        expect(item).to have_key(:id)
        expect(item[:id]).to be_a(Hash)
        expect(item).to have_key(:snippet)
        expect(item[:snippet]).to be_a(Hash)
        expect(item[:snippet]).to have_key(:title)
        expect(item[:snippet][:title]).to be_a(String)
      end
    end
  end
end