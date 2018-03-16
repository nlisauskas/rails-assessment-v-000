class RoundsController < ApplicationController
  def new
    @round = Round.new
    @round.build_course
  end

  def index
    if params[:user_id]
      @user = User.find_by_id(params[:user_id])
      @rounds = @user.rounds
    elsif params[:course_id]
      @course = Course.find_by_id(params[:course_id])
      @rounds = @course.rounds
    else
      @rounds = Round.all
    end

  end

  def create

    if params[:round][:course_id] != ""
      @round = Round.new(round_params)
      @round.user_id = session[:user_id]
      @round.save
    else
      @course = Course.new
      @course.name = params[:round][:course_attributes][:name]
      @course.city = params[:round][:course_attributes][:city]
      @course.state = params[:round][:course_attributes][:state]
      @course.slope = params[:round][:course_attributes][:slope]
      @course.rating = params[:round][:course_attributes][:rating]
      @course.save
      @round = Round.new(round_params)
      @round.course_id = @course.id
      @round.user_id = session[:user_id]
      @round.save
    end
    if @round.save
        @user = User.find_by_id(@round.user_id)
        @user.calculate_handicap
        redirect_to round_path(@round.id)
    else
      render :new
    end
  end

  def show
    @round = Round.find_by(:id => params[:id])
  end

  def edit
    @round = Round.find_by(:id => params[:id])
  end

  def update
    @round = Round.find_by(:id => params[:id])
    @round.update(round_params)
    @round.save
    @user = User.find_by(session[:user_id])
    @user.calculate_handicap
    redirect_to @round
  end

  def destroy
    @round = Round.find_by(params[:id])
    if @round.user_id == session[:user_id]
      @round.destroy
      redirect_to user_path(session[:user_id])
    else
      redirect_to user_path(session[:user_id])
    end
  end

  private

  def round_params
    params.require(:round).permit(:score, :putts, :course_id, :user_id)
  end
end
