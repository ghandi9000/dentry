class UsersController < ApplicationController
  def index
    if params[:sort_users] || session[:sort_users]
      @users = User.all.order(:name)
    else
      @users = User.all
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User #{@user.email} was successfully destroyed."
    redirect_to users_path
  end
  
  def new
  end

  def edit
    @user = User.find_by_id(params[:id])
  end
  
  def update
    params.require(:user).permit!  # until a better solution
    @user = User.find_by_id(params[:id])
    @user.update_attributes!(params[:user])
    flash[:notice] = "Profile has been updated."
    redirect_to user_path
  end
  
  def create
    @user = User.new(user_params)
    if User.find_by_name(@user.name)
      flash[:warning] = "Sorry, that username is taken."
      render 'users/new'
    elsif @user.password.size < 4
      flash[:warning] = "Password must be at least 4 characters."
      redirect_to welcome_index_path
    elsif @user.save
      flash[:notice] = "Welcome #{@user.name}!  You have successfully signed up."
      redirect_to overview_index_path
    else
      flash[:warning] = "Inputs were invalid."
      render 'users/new'
    end
  end

  def signin
    @user = User.find_by_name(params[:name])
    if @user && (@user[:password] == params[:password])
      flash[:notice] = "Welcome back #{@user.name}"
      render 'overview/index'
    else
      flash[:warning] = "Username/password incorrect"
      render 'welcome/index'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :password, :email)
  end
end
