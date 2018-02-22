class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to signup_path
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    @user.calculate_handicap
    @user.save
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.update(user_params)
    @user.save
    redirect_to @user
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
