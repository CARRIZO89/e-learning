class CourseModulesController < ApplicationController
  before_action :set_course_module

  def show
  	@course_module = CourseModule.find(params[:id])
    # authorize @course_module

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'document', layout: 'pdf', template: 'admin/courses_modules/show_pdf.html.erb'
      end
    end
  end

  private

  def set_course_module
    @course_module = CourseModule.find(params[:id])
  end
end
