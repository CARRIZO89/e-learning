module CourseModulesHelper
  def link_to_embed(link)
    YouTubeRails.youtube_embed_url_only(link, ssl: true)
  end
end
