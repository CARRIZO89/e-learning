class RemovePersonRefsFromInscription < ActiveRecord::Migration[5.0]
  def change
    remove_reference :inscriptions, :person, foreign_key: true
  end
end
