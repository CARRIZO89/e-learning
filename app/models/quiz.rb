class Quiz < ApplicationRecord
  belongs_to :course_module
  has_many :questions
end
