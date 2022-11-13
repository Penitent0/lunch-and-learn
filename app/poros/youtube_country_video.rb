class YoutubeCountryVideo 
  attr_reader :country,
              :title,
              :video_:id

  def initialize(country, title, video_id)
    @country = country
    @title = title
    @video_id = video_id
  end
end