module Teachers
  class InscriptionsController < ApplicationController
    before_filter :set_course

    def index
      @inscriptions = @course.inscriptions
    end

    private

    def set_course
      @course = Course.find params[:course_id]
    end
  end
end
