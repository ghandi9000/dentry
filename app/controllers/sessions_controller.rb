class SessionsController < ApplicationController

  def new
    render 'welcome/index'
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # success: log in user and redirect to users page
      flash[:notice] = 'Welcome back #{user.name}'
      redirect_to user_path(user)
    else
      flash.now[:notice] = 'Incorrect username/password.'
      render 'welcome/index'
    end
  end

  def destroy
  end
end
