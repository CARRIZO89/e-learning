class Inscription < ApplicationRecord
  belongs_to :person
  delegate :full_name,
    :dni,
    :province_name,
    to: :person, prefix: true
  belongs_to :student, foreign_key: :person_id
  belongs_to :course

  validates :person_id, uniqueness: { scope: :course_id }

  def self.enrolled?(course, person)
    self.where(course: course, person: person).exists?
  end
end
