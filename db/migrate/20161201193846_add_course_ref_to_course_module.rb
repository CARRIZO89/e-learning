class AddCourseRefToCourseModule < ActiveRecord::Migration[5.0]
  def change
    add_reference :course_modules, :course, foreign_key: true
  end
end
