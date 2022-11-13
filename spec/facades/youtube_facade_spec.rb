require 'rails_helper'

RSpec.describe YoutubeFacade, type: :facade do 
  describe 'gets youtube service endpoints and instantiates poros', vcr: { record: :new_episodes } do
    it 'instantiates' do
      expect(YoutubeFacade.new).to be_a(YoutubeFacade)
    end

    it 'instantiates youtube country video poro' do
      country_video = YoutubeFacade.country_search('Mexico')

      expect(country_video).to be_a(YoutubeCountryVideo)
      expect(country_video.country).to eq('Mexico')
      expect(country_video.title).to be_a(String)
      expect(country_video.video_id).to be_a(String)
    end
  end
end