ActiveAdmin.register CourseModule do
  permit_params :name, :description, :youtube_link

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
