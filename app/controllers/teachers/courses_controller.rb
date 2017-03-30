module Teachers
  class CoursesController < ApplicationController
    def index
      @courses = current_user.active_courses
    end
  end
end
