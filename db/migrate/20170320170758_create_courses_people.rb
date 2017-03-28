class CreateCoursesPeople < ActiveRecord::Migration[5.0]
  def change
    create_table :courses_people do |t|
      t.integer :course_id
      t.integer :person_id

      t.timestamps
    end
  end
end
