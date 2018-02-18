class RoundsController < ApplicationController
  def new
    @round = Round.new
  end

  def create
    @round = Round.new(round_params)
    if @round.save
      redirect_to @round
    else
      redirect_to new_round_path
    end
  end

  def show
    @round = Round.find_by(params[:id])
  end

  private

  def round_params
    params.require(:round).permit(:score, :putts, :course_id, :user_id => session[:user_id])
  end
end
