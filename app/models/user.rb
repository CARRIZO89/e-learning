class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :person
  delegate :full_name, to: :person
  belongs_to :role

  accepts_nested_attributes_for :person
end
