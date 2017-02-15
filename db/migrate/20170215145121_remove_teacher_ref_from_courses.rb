class RemoveTeacherRefFromCourses < ActiveRecord::Migration[5.0]
  def change
    remove_column :courses, :teacher_id, :integer
  end
end
