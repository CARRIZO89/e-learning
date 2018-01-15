class CourseModulesController < ApplicationController
  before_action :set_course_module

  def show
    authorize @course_module
  end

  private

  def set_course_module
    @course_module = CourseModule.find(params[:id])
  end
end
