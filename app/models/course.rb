class Course < ApplicationRecord
  has_attached_file :image, preserve_files: true, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment_file_name :image, :matches => [/jpg\Z/, /jpe?g\Z/, /jpeg\Z/, /png\Z/, /gif\Z/]
  validates :name, presence: {message: 'No puede estar en blanco.' }

  has_many :course_modules
  has_many :inscriptions
  has_many :people, through: :inscriptions

end
