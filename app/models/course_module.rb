class CourseModule < ApplicationRecord
  belongs_to :course
  has_many :quizzes
end
