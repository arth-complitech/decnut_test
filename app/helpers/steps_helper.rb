module StepsHelper
	def embed(url_to_youtube)
    youtube_id = url_to_youtube.try(:split,"=")
    if youtube_id.present? 
    	youtube_id = youtube_id.last
		content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  	end
  end
end
