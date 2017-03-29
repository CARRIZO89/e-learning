class Teacher < Person
  has_and_belongs_to_many :courses

  def active_courses
    Course
      .joins('INNER JOIN courses_people ON courses_people.course_id = courses.id')
      .where('courses_people.person_id = ?', self.id)
      .where('start_date < ?', Date.today)
      .where('finish_date > ?', Date.today)
  end

  def last_active_courses
    active_courses.limit(10)
  end

  def last_completed_courses
     Course
      .joins('INNER JOIN courses_people ON courses_people.course_id = courses.id')
      .where('courses_people.person_id = ?', self.id)
      .where('courses.finish_date < ?', Date.today)
      .limit(10)
  end
end
