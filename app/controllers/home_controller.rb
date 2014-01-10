class HomeController < ApplicationController
  skip_before_action :check_user

  def index
    if current_user
      redirect_to user_url
    end
  end
end
