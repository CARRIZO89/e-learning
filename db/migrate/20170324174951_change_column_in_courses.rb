class ChangeColumnInCourses < ActiveRecord::Migration[5.0]
  def change
    rename_column :courses, :no_resolution, :resolution_number
  end
end
