module Teachers
  class CoursesController < ApplicationController
    def index
      @courses = current_user.active_courses
    end

    def show
      @course = current_user.active_courses.find(params[:id])
    end
  end
end
