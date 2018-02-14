ActiveAdmin.register Inscription do
  belongs_to :course
  navigation_menu :course

  permit_params :course_id, :person_id, :payment


  filter :person_id, as: :select, collection: Student.all
  filter :course_id, as: :select, collection: Course.all
  
  #El código debajo reescribe el index del inscription_controller dandole una nueva forma de responder, en este caso como pdf
  controller do
    def index
      respond_to do |format|
        format.html { super }
        format.csv  { super }
        format.xml  { super }
        format.json { super }

        format.pdf do
          render pdf: 'inscriptions', layout: 'pdf', template: 'admin/inscriptions/index_pdf.html.erb'
        end
      end
    end
  end

  # action_item :import_pdf, only: :index do #Genera un btn
  #   link_to 'Import PDF', inscriptions_es_path(:pdf) #link al elemento que quiero ver. Le paso por parametro el elemento y la extensión pdf para forma la url correcta
  # end

   action_item :import_pdf, only: :show do #Genera un btn
     link_to 'Import PDF', inscription_es_path(Inscription.find(params[:id]), :pdf) #link al elemento que quiero ver. Le paso por parametro el elemento y la extensión pdf para forma la url correcta
   end

  index download_links: [:csv, :xml, :json, :pdf] do #"download_links" agrega un nuevo link a la colección de links del index, el cual permite descargar todo el index como pdf
    selectable_column
    column :id
    column :course_id
    column :person_id
    column :dni do |c|
      c.person.dni
    end
    column :payment
    actions
  end

  form do |f|
    f.inputs do
      f.input :course_id, as: :select, collection: Course.between_dates(Date.today, :start_inscription_date, :finish_inscription_date)
      f.input :person_id, as: :select, collection: Student.all
      f.input :payment
    end
    f.actions
  end
end
