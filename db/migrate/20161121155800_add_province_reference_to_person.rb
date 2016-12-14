class AddProvinceReferenceToPerson < ActiveRecord::Migration[5.0]
  def change
    add_reference :people, :province, foreign_key: true
  end
end
