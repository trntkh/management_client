class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.filter_user_by(params)
  end
  
  def my_requests
    @requests = Request.where(user_id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def change_password
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:avatar, :first_name, :last_name, :nationality, :address, :phone, :language, :role, :bio, :description, :status, :email, :password, :password_confirmation, :user_type)
  end
end