require 'rails_helper'

RSpec.describe UnsplashService, type: :service do 
  describe 'gets endpoints from unsplash api', vcr: { record: :new_epsidoes } do
    it 'instantiates' do
      expect(UnsplashService.new).to be_a(UnsplashService)
    end

    it 'has successful response on connection' do
      response = UnsplashService.conn.get('/search/photos')
      require 'pry'; binding.pry
    end
  end
end