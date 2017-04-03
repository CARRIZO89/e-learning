ActiveAdmin.register CourseModule do
  belongs_to :course
  navigation_menu :course

  permit_params :name, :description, :youtube_link, :course_id

  sidebar "Detalle del Módulo", only: [:show, :edit] do
    ul do
      li link_to "Hábilitaciones", admin_course_module_course_module_people_path(resource)
    end
  end
  
  filter :id
  filter :name
  filter :course_id
  filter :created_at
  filter :updated_at

  index do
    column :id
    column :name
    column :course_id
    column :created_at
    column :updated_at
    actions
  end


  form do |f|
    f.inputs do
      f.input :name
      f.input :course_id, as: :select, collection: Course.all
      f.input :youtube_link
      f.input :description
    end
    f.actions
  end
end
