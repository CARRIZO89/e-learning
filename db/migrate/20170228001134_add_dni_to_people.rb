class AddDniToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :dni, :integer
    add_index :people, :dni, unique: true
  end
end
