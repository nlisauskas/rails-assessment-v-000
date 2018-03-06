class RoundsController < ApplicationController
  def new
    @round = Round.new
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
    @round = Round.new(round_params)
    @round.user_id = session[:user_id]
    if @round.save
      @user = User.find_by(session[:user_id])
      @user.calculate_handicap
      redirect_to @round
    else
      render :new
    end
  end

  def show
    @round = Round.find_by(params[:id])
  end

  def edit
    @round = Round.find_by(params[:id])
  end

  def update
    @round = Round.find_by(params[:id])
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
    params.require(:round).permit(:score, :putts, :course_id)
  end
end
