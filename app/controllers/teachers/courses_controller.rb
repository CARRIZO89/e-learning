module Teachers
  class CoursesController < ApplicationController
    def index
      @courses = current_user.active_courses
    end

    def show
      @course = current_user.person.inscriptions.find(params[:id]).course
    end
  end
end
