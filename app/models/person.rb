class Person < ApplicationRecord
  belongs_to :province
  #has_one :user, dependent: :destroy
  has_many :inscriptions
  has_many :courses, through: :inscriptions
  # has_one :user, foreign_key: :people_id

  # accepts_nested_attributes_for :user
end