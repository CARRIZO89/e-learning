ActiveAdmin.register Modality do
  permit_params :name, :description

  filter :id
  filter :name
  filter :created_at
  filter :updated_at
  
  index do
    selectable_column
    column :id
    column :name
    column :created_at
    column :updated_at
    actions
  end


end
