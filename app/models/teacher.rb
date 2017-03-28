class Teacher < Person
  has_and_belongs_to_many :courses
end
