ActiveAdmin.register Course do
  permit_params :name, :no_resolution, :modality_id, :resolution, :start_date, :finish_date, 
                :summary, :description, :image

  index do
    column :id
    column :name
    column :summary
    column :no_resolution
    column :modality_id
    column :start_date
    column :finish_date
    actions
  end

  form do |f|
    f.inputs do
      f.input :modality_id, as: :select, collection: Modality.all
      f.input :name
      f.input :no_resolution
      f.input :start_date
      f.input :finish_date
      f.input :description
      f.input :summary
    end
    f.actions
  end
end
