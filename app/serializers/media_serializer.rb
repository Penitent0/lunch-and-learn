class MediaSerializer
  def self.media(country, video, images)
    {
      data: {
        id: "null",
        type: "learning_resource",
        attributes: {
          country: country,
          video: verify_video(video),
          images: images.map do |image|
            {
            alt_tag: image.alt_tag,
            url: image.url
            }
          end
        }
      }
    }
  end

  def self.verify_video(video)
    if !video
      return []
    else 
      {
        title: video.title,
        youtube_video_id: video.video_id
      }
    end
  end
end