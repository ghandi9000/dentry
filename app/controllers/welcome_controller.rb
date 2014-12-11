class WelcomeController < ApplicationController
  def index
  end

  def signin
  end

  def signup
    redirect_to new_user_path
  end
  
end
