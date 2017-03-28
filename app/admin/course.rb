ActiveAdmin.register Course do
  permit_params :name, :no_resolution, :modality_id, :resolution, :start_date, :finish_date,
                :summary, :description, :image, :topic_list, :start_inscription_date, :finish_inscription_date, teacher_ids: []

  index do
    column :id
    column :name
    column :no_resolution
    column :start_inscription_date
    column :finish_inscription_date
    column :start_date
    column I18n.t "courses.module_quantity" do |c|
      c.course_modules.count
    end
    actions
  end

  show do
    tabs do
      tab I18n.t "courses.show" do
        attributes_table do
          row :id
          row :name
          row :no_resolution
          row :created_at
          row :updated_at
          row :modality_id
          row :start_inscription_date
          row :finish_inscription_date
          row :start_date
          row :finish_date
          row :summary
          row :description
        end
      end

      tab I18n.t "course_modules.index" do
        table_for course.course_modules do
          column :id
          column :name
          column :description
        end
      end

      tab I18n.t "courses.resolution_info" do
        attributes_table do
          row :resolution_file_name
          row :resolution_content_type
          row :resolution_file_size
          row :resolution_updated_at
        end
      end

      tab I18n.t "courses.banner_info" do
        attributes_table do
          row :image_file_name
          row :image_content_type
          row :image_file_size
          row :image_updated_at
          row :banner do |banner|
            image_tag banner.image.url
          end
        end
      end

      tab I18n.t "courses.teachers" do
        table_for course.teachers do
          column :full_name
          column :dni
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
      f.input :start_inscription_date, as: :datepicker
      f.input :finish_inscription_date, as: :datepicker
      f.input :description
      f.input :summary
      f.input :teachers, as: :check_boxes, collection: Teacher.all.map {|u| [u.full_name.to_s, u.id]}, multiple: true
      f.input :topic_list, input_html: { value: f.object.topic_list.join(', ') }
    end
    f.actions
  end
end
