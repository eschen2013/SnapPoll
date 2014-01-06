class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to root_url
    end
  end
end
