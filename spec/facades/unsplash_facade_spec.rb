require 'rails_helper'

RSpec.describe UnsplashFacade, type: :facade do 
  describe 'gets unsplash service endpoints and instantiates poros', vcr: { record: :new_episodes } do
    it 'instantiates' do
      expect(UnsplashFacade.new).to be_a(UnsplashFacade)
    end

    it 'instantiates unsplash photos poros' do
      
    end
  end
end