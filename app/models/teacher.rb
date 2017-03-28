class Teacher < Person
  has_and_belongs_to_many :courses

  def last_active_courses
    Course
      .joins('INNER JOIN courses_people ON courses_people.course_id = courses.id')
      .where('courses_people.person_id = ?', self.id)
      .limit(10)
  end
end
