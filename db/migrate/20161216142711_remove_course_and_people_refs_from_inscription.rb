class RemoveCourseAndPeopleRefsFromInscription < ActiveRecord::Migration[5.0]
  def change
    remove_reference :inscriptions, :course, foreign_key: true
    remove_reference :inscriptions, :people, foreign_key: true
  end
end
