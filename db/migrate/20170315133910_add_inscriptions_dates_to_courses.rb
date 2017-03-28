class AddInscriptionsDatesToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :start_inscription_date, :date
    add_column :courses, :finish_inscription_date, :date
  end
end
