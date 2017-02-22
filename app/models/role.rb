class Role < ApplicationRecord
  STUDENT_ID = 3

  has_many :users

  def self.student
    self.find STUDENT_ID
  end
end