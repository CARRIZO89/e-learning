class CreateQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes do |t|
      t.integer :pass_points
      t.integer :time_in_seconds

      t.timestamps
    end
  end
end
