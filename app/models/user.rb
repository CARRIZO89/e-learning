class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :person
  delegate :full_name,
    :province_name,
    :last_active_courses,
    :type,
    :progress_for,
    :dni,
    :last_completed_courses,
    :active_courses,
    to: :person, allow_nil: true
  belongs_to :role

  accepts_nested_attributes_for :person
end
