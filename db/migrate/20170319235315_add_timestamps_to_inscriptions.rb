class AddTimestampsToInscriptions < ActiveRecord::Migration[5.0]
  def change
    change_table :inscriptions do |t|
      t.timestamps
    end
  end
end
