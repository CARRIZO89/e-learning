class Student < Person
  has_many :habilitations, class_name: 'CourseModulePerson',
    foreign_key: :people_id

  def active_courses
    courses.active
  end

  def last_active_courses
    active_courses.limit(10)
  end

  def last_completed_courses
    courses
      .where('finish_date < ?', Date.today)
      .limit(10)
  end
end
