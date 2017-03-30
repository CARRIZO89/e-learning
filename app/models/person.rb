class Person < ApplicationRecord
  belongs_to :province
  delegate :name, to: :province, prefix: true
  has_one :user, dependent: :destroy
  has_many :inscriptions
  has_many :courses, through: :inscriptions

  def full_name
    "#{last_name}, #{first_name}"
  end

  def progress_for(course)
    (course.count_modules / course.count_modules) * 100
  end
end
