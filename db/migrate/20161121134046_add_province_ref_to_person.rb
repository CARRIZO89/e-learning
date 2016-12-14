class AddProvinceRefToPerson < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :province_id, :integer
  end
end
