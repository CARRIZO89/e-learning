class AddQuizDescriptionToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :quiz_description, :string
  end
end
