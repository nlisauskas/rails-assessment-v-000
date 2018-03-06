class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
     session[:user_id] = user.id
    render 'welcome/home'
  end

  def destroy
    session.destroy

    render 'welcome/home'
  end
end
