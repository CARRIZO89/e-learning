class ChangePersonReferenceInInscription < ActiveRecord::Migration[5.0]
  def change
    add_reference :inscriptions, :person, foreign_key: true
    remove_reference :inscriptions, :people, index: true
  end
end
