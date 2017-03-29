ActiveAdmin.register Course do
  permit_params :name, :resolution_number, :modality_id, :resolution, :start_date, :finish_date,
                :summary, :description, :image, :topic_list, :start_inscription_date, :finish_inscription_date, teacher_ids: []

  index do
    column :id
    column :name
    column :resolution_number
    column :start_inscription_date
    column :finish_inscription_date
    column :start_date
    column I18n.t "courses.module_quantity" do |c|
      c.course_modules.count
    end
    actions
  end

  sidebar "Detalle del Curso", only: [:show, :edit] do
    ul do
      li link_to "Módulos",       admin_course_course_modules_path(resource)
      li link_to "Inscripciones", admin_course_inscriptions_path(resource)
    end
  end

  show do
    tabs do
      tab I18n.t "courses.show.course_detail" do
        attributes_table do
          row :id
          row :name
          row :resolution_number
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
      f.input :resolution_number
      f.input :resolution
      f.input :image
      f.input :start_date, as: :datepicker, :html_option => { value: Date.today }
      f.input :finish_date, as: :datepicker, :html_option => { value: Date.today }
      f.input :start_inscription_date, as: :datepicker, :html_option => { value: Date.today }
      f.input :finish_inscription_date, as: :datepicker, :html_option => { value: Date.today }
      f.input :description
      f.input :summary
      f.input :teachers, as: :check_boxes, collection: Teacher.all.map {|u| [u.full_name.to_s, u.id]}, multiple: true
      f.input :topic_list, input_html: { value: f.object.topic_list.join(', ') }
    end
    f.actions
  end
end
