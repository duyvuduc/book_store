class UsersController < ApplicationController
  before_action :set_user, only: [:update, :edit, :show, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to users_path
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Update sucessfully'
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @user.destroy
      redirect_to users_path, notice: 'Delete sucessfully'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :year_old, addresses_attributes: [:id, :city, :street])
    end

    def set_user
      @user = User.find(params[:id])
    end
end
