require 'rails_helper'

RSpec.describe YoutubeService, type: :service do 
  describe 'gets endpoints from Youtube API', vcr: { record: :new_episodes } do 
    it 'instantiates' do
      expect(YoutubeService.new).to be_a(YoutubeService)
    end

    it 'has successful response on connection' do
      response = YoutubeService.conn.get()
      expect(response.status).to eq(200)
    end
  end
end