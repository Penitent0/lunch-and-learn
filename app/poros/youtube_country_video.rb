class YoutubeCountryVideo 
  attr_reader :country,
              :video_id,
              :title

  def initialize(country, video_id, title)
    @country = country
    @title = title
    @video_id = video_id
  end
end