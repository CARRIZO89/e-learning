class AddDatesAndDescriptionToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :start_date, :date, null: false
    add_column :courses, :finish_date, :date, null: false
    add_column :courses, :description, :text
  end
end
