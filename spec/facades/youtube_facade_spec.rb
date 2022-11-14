require 'rails_helper'

RSpec.describe YoutubeFacade, type: :facade do 
  describe 'gets youtube service endpoints and instantiates poros', vcr: { record: :new_episodes } do
    it 'instantiates' do
      expect(YoutubeFacade.new).to be_a(YoutubeFacade)
    end

    it 'instantiates youtube country video poro' do
      video_array = YoutubeFacade.country_search('Mexico')

      video = video_array.first

      expect(video).to be_a(YoutubeCountryVideo)
      expect(video.country).to eq('Mexico')
      expect(video.title).to be_a(String)
      expect(video.video_id).to be_a(String)
    end
  end
end