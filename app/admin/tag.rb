ActiveAdmin.register Tag do
  menu label: proc{ I18n.t("activerecord.models.tags") }
  permit_params :name

  filter :taggings
  filter :courses
  filter :name
  
  index do
    selectable_column
    column :id
    column :name
    column :taggings_count
    actions
  end


end
