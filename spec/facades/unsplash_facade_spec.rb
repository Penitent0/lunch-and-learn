require 'rails_helper'

RSpec.describe UnsplashFacade, type: :facade do 
  describe 'gets unsplash service endpoints and instantiates poros', vcr: { record: :new_episodes } do
    it 'instantiates' do
      expect(UnsplashFacade.new).to be_a(UnsplashFacade)
    end

    it 'instantiates unsplash photos poros' do
      photos = UnsplashFacade.country_search('Mexico')

      expect(photos).to be_a(Array)
      photos.each do |photo|
        expect(photo).to be_a(UnsplashCountryPhoto)
        expect(photo.alt_tag).to be_a(String)
        expect(photo.url).to be_a(String)
        expect(photo.country).to eq('Mexico')
      end
    end
  end
end