class AddModalityRefToCourse < ActiveRecord::Migration[5.0]
  def change
    add_reference :courses, :modality, foreign_key: true
  end
end
