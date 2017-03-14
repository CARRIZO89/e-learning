class AddDescriptionToModality < ActiveRecord::Migration[5.0]
  def change
    add_column :modalities, :description, :text
  end
end
