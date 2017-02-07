class AddPeopleIdToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_reference :teachers, :people, foreign_key: true
  end
end
