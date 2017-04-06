class Guests::CoursesController < ApplicationController
  before_action :set_course, only: [:show]

  def index
    @courses = Course.unstarted
  end

  def show
    @course = Course.find(params[:id])
  end

  def set_course
    @course = Course.find(params[:id])
  end
end
