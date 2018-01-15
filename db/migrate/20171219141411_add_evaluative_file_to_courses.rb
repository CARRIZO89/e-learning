class AddEvaluativeFileToCourses < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :courses, :evaluative_file
  end
end
