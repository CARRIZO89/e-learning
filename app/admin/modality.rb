ActiveAdmin.register Modality do
  permit_params :name, :description

  index do
    selectable_column
    column :id
    column :name
    column :created_at
    column :updated_at
    actions
  end

end
