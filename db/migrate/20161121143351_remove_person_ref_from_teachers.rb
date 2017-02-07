class RemovePersonRefFromTeachers < ActiveRecord::Migration[5.0]
  def change
    remove_column :teachers, :person_id, :integer
  end
end
