class AddCourseModuleRefToQuiz < ActiveRecord::Migration[5.0]
  def change
    add_reference :quizzes, :course_module, foreign_key: true
  end
end
