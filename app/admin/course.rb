ActiveAdmin.register Course do
  permit_params :name, :no_resolution, :modality_id, :resolution, :start_date, :finish_date, 
                :summary, :description, :image

  index do
    column :id
    column :name
    column :summary
    column :no_resolution
    column :start_date
    column :finish_date
    column I18n.t "courses.module_quantity" do |c|
      c.course_modules.count
    end
    actions
  end

  show do
    tabs do
      tab I18n.t "courses.show" do
        attributes_table do
          default_attribute_table_rows.each do |field|
            row field
          end
        end
      end
      tab I18n.t "course_modules.index" do
        table_for course.course_modules do
          column :id
          column :name
          column :description
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :modality_id, as: :select, collection: Modality.all
      f.input :name
      f.input :no_resolution
      f.input :resolution
      f.input :image
      f.input :start_date, as: :datepicker
      f.input :finish_date, as: :datepicker
      f.input :description
      f.input :summary
    end
    f.actions
  end
end
