class Teacher < ApplicationRecord
  belongs_to :person, foreign_key: 'people_id'
  accepts_nested_attributes_for :person


end
