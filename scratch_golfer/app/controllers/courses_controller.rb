class CoursesController < ApplicationController

  def index
    if params[:user_id]
      @user = User.find_by_id(params[:user_id])
      @courses = @user.courses
    else
      @courses = Course.all
    end
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
