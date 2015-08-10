class UsersController < ApplicationController

  before_action :signed_in_user, only: [:index, :edit]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Test App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Please sign in."
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
