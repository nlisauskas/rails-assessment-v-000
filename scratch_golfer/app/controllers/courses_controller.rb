class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.save
    redirect_to course_path(@course)
  end

  def show
    @course = Course.find_by(:id => params[:id])
  end

  private

  def course_params
    params.require(:course).permit(:name, :city, :state, :slope, :rating)
  end

end
