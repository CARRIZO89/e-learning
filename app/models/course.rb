class Course < ApplicationRecord
  
  validates :name, presence: {message: 'No puede estar en blanco.' }
  has_and_belongs_to_many :users
  has_many :course_modules

end
