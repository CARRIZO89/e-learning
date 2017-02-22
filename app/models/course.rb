class Course < ApplicationRecord
  validates :name, presence: {message: 'No puede estar en blanco.' }
  has_many :course_modules
  has_many :inscriptions
  has_many :people, through: :inscriptions
  belongs_to :modality

end
