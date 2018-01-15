module Teachers
  class CoursesController < ApplicationController
    before_action :set_course, only: [:show, :edit, :update]

    def index
      @courses = current_user.active_courses
    end

    def show
    end

    def edit
    end

    def update
      respond_to do |format|
        if @course.update(course_params)
          format.html { redirect_to teachers_course_es_path(@course), notice: 'Course was successfully updated.' }
          format.json { render :show, status: :ok, location: @course }
        else
          format.html { render :edit }
          format.json { render json: @course.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    def set_course
      @course = current_user.active_courses.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:evaluative_file, :quiz_description)
    end
  end
end
