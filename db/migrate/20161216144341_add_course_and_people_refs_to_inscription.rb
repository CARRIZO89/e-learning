class AddCourseAndPeopleRefsToInscription < ActiveRecord::Migration[5.0]
  def change
    add_reference :inscriptions, :people, foreign_key: true
    add_reference :inscriptions, :course, foreign_key: true
  end
end
