class UsersController < ApplicationController
  before_action :authorize_admin, only: [:edit, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You've successfully signed up!"
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem signing up."
      redirect_to '/signup'
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end
  
  def destroy
    @users = User.all
    if User.find(session[:user_id]) == User.find(params[:id])
      flash[:notice] = "You can't delete your own account!"
      render :admin_user
    else
      @user = User.find(params[:id])
      @user.destroy
      flash[:notice] = "You deleted a user's account."
      render :admin_user
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :admin)
  end
end