class AddPeopleToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :people_id, :integer
  end
end
