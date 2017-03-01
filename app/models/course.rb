class Course < ApplicationRecord
  has_attached_file :image, preserve_files: true, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :resolution, preserve_files: true
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment_file_name :image, :matches => [/jpg\Z/, /jpe?g\Z/, /jpeg\Z/, /png\Z/, /gif\Z/]
  validates_attachment_content_type :resolution, content_type: ['application/pdf']
  validates_attachment_file_name :resolution, :matches => [/pdf\Z/]
  validates :name, presence: {message: 'No puede estar en blanco.' }

  has_many :course_modules
  has_many :inscriptions
  has_many :people, through: :inscriptions
  belongs_to :modality

end
