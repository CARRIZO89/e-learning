class Course < ApplicationRecord
  has_attached_file :resolution, preserve_files: true
  validates_attachment_content_type :resolution, content_type: ['application/pdf']
  validates_attachment_file_name :resolution, :matches => [/pdf\Z/]
  validates :name, presence: {message: 'No puede estar en blanco.' }

  has_many :course_modules
  has_many :inscriptions
  has_many :people, through: :inscriptions
  belongs_to :modality

end
