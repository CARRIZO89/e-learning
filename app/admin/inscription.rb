ActiveAdmin.register Inscription do
  permit_params :course_id, :person_id

  filter :person_id, as: :select, collection: Person.where(type: "Student")
  filter :course_id, as: :select, collection: Course.all

  index do
    selectable_column
    column :id
    column :course_id
    column :person_id
    column :dni do |c|
      c.person.dni
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :course_id, as: :select, collection: Course.between_dates(Date.today, :start_inscription_date, :finish_inscription_date)
      f.input :person_id, as: :select, collection: Student.all
    end
    f.actions
  end
end
