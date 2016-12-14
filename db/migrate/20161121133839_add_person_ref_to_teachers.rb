class AddPersonRefToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :person_id, :integer
  end
end
