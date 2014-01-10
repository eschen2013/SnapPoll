class SessionsController < ApplicationController
  skip_before_action :check_user

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    if flash[:referer]
      redirect_to flash[:referer]
    else
      redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end