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
    (count_approved_modules_for(course).to_f / course.count_modules.to_f) * 100
  end

  def approved_modules_for(course)
    CourseModulePerson
      .approved
      .where(student: self, course_module: course.course_modules)
  end

  def count_approved_modules_for(course)
    approved_modules_for(course).count
  end
end
