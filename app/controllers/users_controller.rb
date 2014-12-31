class UsersController < ApplicationController
  # http_basic_authenticate_with name: "dhh", password: "secret"
  
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
    @user = User.new
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
    if @user.save
      flash[:notice] = "#{@user.name}'s account created successfully."
      redirect_to user_path(@user)
    else
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
    params.require(:user).permit(:name, :password, :email,
      :password_confirmation)
  end
end
