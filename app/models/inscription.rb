class Inscription < ApplicationRecord
  belongs_to :person
  delegate :full_name,
    :dni,
    :province_name,
    to: :person, prefix: true
  belongs_to :course
end
