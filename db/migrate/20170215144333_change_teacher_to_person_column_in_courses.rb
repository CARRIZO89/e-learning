class ChangeTeacherToPersonColumnInCourses < ActiveRecord::Migration[5.0]
  def change
    add_reference :courses, :person, foreign_key: true
    remove_reference :courses, :people, index: true
  end
end
