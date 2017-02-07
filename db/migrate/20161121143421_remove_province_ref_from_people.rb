class RemoveProvinceRefFromPeople < ActiveRecord::Migration[5.0]
  def change
    remove_column :people, :province_id, :integer
  end
end
