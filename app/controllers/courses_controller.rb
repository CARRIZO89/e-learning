class CoursesController < ApplicationController
  before_action :set_course, only: [:show]

  def index
    @courses = Course.unstarted
    unless params[:filter].nil?
      case params[:filter][:has_resolution_number]
        when "true"
          @courses = @courses.where("resolution_number != ''")
        when "false"
          @courses = @courses.where(resolution_number: '')
      end
    end
  end

  def show
    @course = Course.find(params[:id])
    # @already_enrolled = Inscription.enrolled?(@course, current_person)

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'document', layout: 'pdf', template: 'admin/courses/show_pdf.html.erb'
      end
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end
end
