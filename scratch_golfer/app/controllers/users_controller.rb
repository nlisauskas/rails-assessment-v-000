class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to signup_path
    end
  end

  def show
    @user = User.find_by(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :hometown, :handicap, :password, :password_confirmation)
  end

  def logged_in?
    if !session[:user_id]
      redirect_to root_path
    end
  end
end
