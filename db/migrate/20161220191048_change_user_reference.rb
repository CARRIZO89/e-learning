class ChangeUserReference < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :person, foreign_key: true
    remove_reference :users, :people, index: true
  end
end
