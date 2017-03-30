class CourseModulePerson < ApplicationRecord
  belongs_to :student, foreign_key: :people_id
  belongs_to :person, foreign_key: :people_id
  belongs_to :course_module

  enum status: [:ongoing, :approved, :disapproved]

  def course_students
    course_module.course.students
  end

  def available_habilitation_ids
    course_students.pluck(:id) - CourseModulePerson
      .where(course_module: course_module)
      .pluck(:people_id)
  end

  def available_habilitations
    course_students.where(id: available_habilitation_ids)
  end
end
