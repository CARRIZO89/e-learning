class RemovePersonRefFromCourses < ActiveRecord::Migration[5.0]
  def change
    remove_column :courses, :person_id, :integer
  end
end
