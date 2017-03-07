class Person < ApplicationRecord
  belongs_to :province
  has_one :user, dependent: :destroy
  has_many :inscriptions
  has_many :courses, through: :inscriptions

  def full_name
    "#{last_name}, #{first_name}"
  end
end
