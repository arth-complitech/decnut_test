module StepsHelper
	def embed(url_to_youtube)
    youtube_id = url_to_youtube.try(:split,"=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end
end
