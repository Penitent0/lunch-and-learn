require 'rails_helper'

RSpec.describe EdamanService, type: :service do
  describe 'gets endpoints for edaman receipe service', vcr: { record: :new_episodes } do
    it "Instantiates" do
      expect(EdamanService.new).to be_a(EdamanService)
    end

    it 'has successful response on connection' do
      response = EdamanService.conn.get('/api/recipes/v2')
      expect(response.status).to eq(200)
    end

    it 'has recipe search method by country method' do
      response = EdamanService.recipe_search_endpoint('mexico')

      expect(response).to be_a(Hash)
      expect(response).to have_key(:from)
      expect(response[:from]).to be_a(Integer)
      expect(response).to have_key(:count)
      expect(response[:count]).to be_a(Integer)
      expect(response).to have_key(:_links)
      expect(response[:_links]).to be_a(Hash)
      expect(response).to have_key(:hits)
      expect(response[:hits]).to be_a(Array)
    end
  end
end