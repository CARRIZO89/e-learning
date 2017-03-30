class AddStudentModuleRelationship < ActiveRecord::Migration[5.0]
  def change
    create_table :course_module_people do |t|
      t.belongs_to :course_module
      t.belongs_to :people
      t.integer :status, default: 0
    end
  end
end
