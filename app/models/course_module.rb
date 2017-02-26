class CourseModule < ApplicationRecord
  belongs_to :course
  has_many :quizzes

  def link_to_embed
    self.youtube_link.split('=').last if self.youtube_link
  end
end
