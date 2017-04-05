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
    @already_enrolled = Inscription.enrolled?(@course, current_person)
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end
end
