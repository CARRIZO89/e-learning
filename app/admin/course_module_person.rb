ActiveAdmin.register CourseModulePerson do
  belongs_to :course_module
  navigation_menu :course_module

  permit_params :people_id

  index do
    column :id
    column :student
    actions
  end

  form do |f|
    f.inputs do
      f.input :student,
        collection: resource.available_habilitations
    end
    f.actions
  end
end
