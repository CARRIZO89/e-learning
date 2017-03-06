class AddSummaryToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :summary, :string
  end
end
