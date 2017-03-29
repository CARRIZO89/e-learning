class CourseModule < ApplicationRecord
  validate :valid_youtube_link

  belongs_to :course
  delegate :multiple_choice?, to: :course
  has_many :quizzes
  has_many :course_module_people

  def valid_youtube_link
    unless (youtube_link.include?("youtube.com") || youtube_link.include?("youtu.be"))
      errors.add(:youtube_link, "It isnt a youtube link")
    end
  end

  def display_name
    name.humanize
  end
end
