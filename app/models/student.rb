class Student < Person
  def last_active_courses
    courses
      .where('start_date < ?', Date.today)
      .where('finish_date > ?', Date.today)
      .limit(10)
  end

  def last_completed_courses
    courses
      .where('finish_date < ?', Date.today)
      .limit(10)
  end
end
