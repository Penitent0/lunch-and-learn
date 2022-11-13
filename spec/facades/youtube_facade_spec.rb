require 'rails_helper'

RSpec.describe YoutubeFacade, type: :facade do 
  describe 'gets youtube service endpoints and instantiates poros' do
    it 'instantiates' do
      expect(YoutubeFacade.new).to be_a(YoutubeFacade)
    end

    it 'instantiates youtube country video poro' do
      country_video = YoutubeFacade.country_search('Mexico')

      require 'pry'; binding.pry
    end
  end
end