class Students::CoursesController < ApplicationController
  def index
    @courses = current_person.courses.order(finish_date: :desc)
  end

  def show
    @course = current_person.courses.find(params[:id])
  end
end
