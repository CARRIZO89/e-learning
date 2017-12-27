module Teachers
  class CoursesController < ApplicationController
    before_action :set_course, only: [:show, :edit]
    def index
      @courses = current_user.active_courses
    end

    def show
    end

    def edit
    end

    def update
      @course.update!(update_params)
      redirect_to @course
    end

    private

    def set_course
      @course = current_user.active_courses.find(params[:id])
    end

    def update_params
      params.require(:course).permit(:evaluative_file, :quiz_description)
    end
  end
end
