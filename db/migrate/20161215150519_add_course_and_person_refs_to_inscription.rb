class AddCourseAndPersonRefsToInscription < ActiveRecord::Migration[5.0]
  def change
    add_reference :inscriptions, :person, foreign_key: true
    add_reference :inscriptions, :course, foreign_key: true
  end
end
