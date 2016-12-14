class CreateCourseModules < ActiveRecord::Migration[5.0]
  def change
    create_table :course_modules do |t|
      t.string :name

      t.timestamps
    end
  end
end
