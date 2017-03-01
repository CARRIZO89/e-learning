class ChangeDniInPerson < ActiveRecord::Migration[5.0]
  def self.up
    change_column :people, :dni, :string, null: false
  end

  def self.down
    change_column :people, :dni, 'integer USING CAST(dni AS integer)'
  end
end
