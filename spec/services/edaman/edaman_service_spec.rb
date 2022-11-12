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
  end
end