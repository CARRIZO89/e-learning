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

  controller do
    def index
      respond_to do |format|
        format.html { super }
        format.csv  { super }
        format.xml  { super }
        format.json { super }

        format.pdf do
          render pdf: 'courses_modules', layout: 'pdf', template: 'admin/courses_modules/modules_index_pdf.html.erb'
        end
      end
    end
  end
  
  action_item :import_pdf, only: :show do #Genera un btn
    link_to 'Import PDF', course_module_es_path(CourseModule.find(params[:id]), :pdf) #link al elemento que quiero ver. Le paso por parametro el elemento y la extensión pdf para forma la url correcta
  end

  index download_links: [:csv, :xml, :json, :pdf] do
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
