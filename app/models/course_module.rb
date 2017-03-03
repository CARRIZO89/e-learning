class CourseModule < ApplicationRecord
  validate :valid_youtube_link

  belongs_to :course
  has_many :quizzes

  def link_to_embed
    YouTubeRails.youtube_embed_url_only(self.youtube_link) if self.youtube_link
  end

  def valid_youtube_link
    unless (youtube_link.include?("youtube.com") || youtube_link.include?("youtu.be"))
      errors.add(:youtube_link, "It isnt a youtube link")
    end
  end
end
