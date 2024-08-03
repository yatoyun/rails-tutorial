class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    Rails.logger.debug "Received parameters: #{params.inspect}"
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def index
    @users = User.all
  end

  private
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
end
